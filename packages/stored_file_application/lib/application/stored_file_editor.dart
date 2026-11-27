import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/application/upload_service.dart';
import 'stored_file_store.dart';
import '/domain/domain.dart';

mixin StoredFileEditor on OptimisticRunner<StoredFileStore> {
  StoredFileRepository get storedFileRepo;
  UploadService get uploadService;

  Future<Either<Failure, void>> deleteFile({required StoredFileId id}) async {
    return await run(
      entityKey: id,
      onApply: (gs) => gs,
      remote: (_) => storedFileRepo.detachFile(id),
      onSuccess: (gs, _) => gs.removeMedia(id),
    );
  }

  /// Place les images de [targetId] dans l'ordre [orderedIds], tout de suite à
  /// l'écran puis côté serveur. En cas d'échec, l'ancien ordre revient.
  ///
  /// Les images encore en cours d'envoi restent à la suite : le serveur ne les
  /// connaît pas.
  Future<Failure?> reorderFiles({
    required Id targetId,
    required TargetType targetType,
    required List<StoredFileId> orderedIds,
  }) async {
    final before = state.getFromOwner(targetId);
    state = state.reorderOwned(targetId, orderedIds);

    final remoteIds = [
      for (final id in orderedIds)
        if (state.get(id)?.isPendingCreation == false) id,
    ];
    final res = await storedFileRepo.reorderFiles(
      targetId,
      targetType,
      remoteIds,
    );
    return res.fold((Failure f) {
      errorLogger?.logError(f, StackTrace.current);
      state = state.reorderOwned(targetId, before);
      return f;
    }, (_) => null);
  }

  /// Légende de [id], tout de suite à l'écran puis côté serveur. En cas
  /// d'échec, l'ancienne revient. Sans effet sur une image encore en envoi.
  Future<Failure?> setCaption({
    required StoredFileId id,
    required String caption,
  }) async {
    final before = state.get(id)?.current;
    if (before is! StoredFileRemoteModel) return null;

    final text = caption.trim();
    if (text == before.caption) return null;

    state = state.setNode(before.copyWith(caption: text));
    final res = await storedFileRepo.setCaption(id, text);
    return res.fold((Failure f) {
      errorLogger?.logError(f, StackTrace.current);
      state = state.setNode(before);
      return f;
    }, (_) => null);
  }

  Future<Failure?> attachFile({
    required Id targetId,
    required TargetType targetType,
    required StoredFileId fileId,
    String caption = '',
  }) async {
    final res = await storedFileRepo.attachFile(
      targetId,
      targetType,
      fileId,
      caption: caption,
    );
    return res.fold(
      (Failure f) {
        errorLogger?.logError(f, StackTrace.current);
        return f;
      },
      (data) {
        final node = state.get(fileId);
        print("attachFile $node");
        if (node == null) {
          state = state.insertStoredFile(targetId, data);
        } else {
          state = state.setNode(data);
        }
        return;
      },
    );
  }

  /// Envoie [file] et l'attache à [targetId].
  ///
  /// Avec [replacing] (image retouchée), la nouvelle prend la place et la
  /// légende de l'ancienne, qui est ensuite supprimée. Si l'envoi échoue,
  /// l'ancienne reste telle quelle.
  Future<Failure?> uploadFile<T>({
    required Id targetId,
    required TargetType targetType,
    required File file,
    StoredFileId? replacing,
  }) async {
    final caption = replacing == null
        ? ''
        : state.get(replacing)?.current.caption ?? '';
    final uploadConf = await uploadService.requestSignedUrl(file);

    return uploadConf.fold(
      (Failure f) {
        errorLogger?.logError(f, StackTrace.current);
        return f;
      },
      (config) async {
        final patch = StoredFilePatchModel(id: config.file.id, file: file);
        state = state.insertStoredFile(targetId, patch);
        final putRes = await uploadService.putFile(
          file,
          config,
          onProgress: (sent, total) {
            final v = patch.copyWith(sent: sent, total: total);
            state = state.updateNode(
              config.file.id,
              (node) => node.copyWith(current: v),
            );
          },
        );
        if (putRes != null) {
          errorLogger?.logError(putRes);
          return putRes;
        }

        final attached = await attachFile(
          targetId: targetId,
          targetType: targetType,
          fileId: config.file.id,
          caption: caption,
        );
        if (attached != null || replacing == null) return attached;

        // Le serveur place l'image attachée en dernier : elle prend la place
        // de l'ancienne avant que celle-ci ne parte.
        final newId = config.file.id;
        final swapped = [
          for (final id in state.getFromOwner(targetId))
            if (id == replacing) newId else if (id != newId) id,
        ];
        final reordered = await reorderFiles(
          targetId: targetId,
          targetType: targetType,
          orderedIds: swapped,
        );
        if (reordered != null) return reordered;

        final deleted = await deleteFile(id: replacing);
        return deleted.fold((Failure f) => f, (_) => null);
      },
    );
  }
}
