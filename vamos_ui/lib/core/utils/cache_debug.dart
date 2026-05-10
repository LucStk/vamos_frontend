import 'package:ferry/ferry.dart';
import 'package:vamos_flutter/features/voyage/requests/modules.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheDebug {
  static void verifyVoyageCache(Client client, {String? expectedVoyageId}) {
    final cacheReq = GGetMeVoyageReq((b) => b..requestId = 'GetMeVoyageReq');
    final data = client.cache.readQuery(cacheReq);

    print('\n═══════════════════════════════════════');
    print('🔍 VÉRIFICATION DU CACHE');
    print('═══════════════════════════════════════');

    if (data == null) {
      print('❌ Cache vide ou inexistant');
      return;
    }

    final edges = data.me?.voyages?.edges;
    if (edges == null || edges.isEmpty) {
      print('❌ Aucun voyage dans le cache');
      return;
    }

    print('📊 Nombre de voyages: ${edges.length}');
    print('─────────────────────────────────────────');

    for (var i = 0; i < edges.length; i++) {
      final node = edges[i]?.node;
      if (node != null) {
        final isExpected =
            expectedVoyageId != null && node.id == expectedVoyageId;
        print('${isExpected ? "✅" : "📝"} Voyage ${i + 1}:');
        print('   ID: ${node.id}');
        print('   Titre: ${node.titre}');
        print('   Description: ${node.description}');
        print('   Date: ${node.date.value}');
        print('─────────────────────────────────────────');
      }
    }

    if (expectedVoyageId != null) {
      final found = edges.any((e) => e?.node?.id == expectedVoyageId);
      if (found) {
        print('✅ Voyage attendu trouvé dans le cache !');
      } else {
        print('❌ Voyage attendu NON trouvé dans le cache !');
      }
    }

    print('═══════════════════════════════════════\n');
  }

  static void compareCache(Client client, String label1, dynamic data1,
      String label2, dynamic data2) {
    print('\n🔄 COMPARAISON DU CACHE');
    print('$label1: ${data1?.me?.voyages?.edges.length ?? 0} voyages');
    print('$label2: ${data2?.me?.voyages?.edges.length ?? 0} voyages');

    if (data1?.me?.voyages?.edges.length != data2?.me?.voyages?.edges.length) {
      print('⚠️  Différence détectée !');
    } else {
      print('✅ Même nombre de voyages');
    }
  }

  static Future<void> inspectHiveBox() async {
    final box = await Hive.openBox("graphql");

    print('\n📦 CONTENU DU BOX HIVE "graphql"');
    print('═══════════════════════════════════════');
    print('Nombre de clés: ${box.length}');

    for (var key in box.keys) {
      final value = box.get(key);
      print('\nClé: $key');
      print('Type: ${value.runtimeType}');
      print(
          'Valeur: ${value.toString().substring(0, value.toString().length > 200 ? 200 : value.toString().length)}...');
    }
    print('═══════════════════════════════════════\n');
  }
}
