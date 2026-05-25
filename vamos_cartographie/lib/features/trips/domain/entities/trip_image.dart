/// Représente une image associée à un trip ou un waypoint.
///
/// [fileKey] : identifiant relatif stocké en DB (ex: "uploads/uuid.jpg").
/// [url]     : URL complète fournie par le backend, prête à l'affichage.
class TripImage {
  final String fileKey;
  final String url;

  const TripImage({required this.fileKey, required this.url});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TripImage && fileKey == other.fileKey && url == other.url);

  @override
  int get hashCode => Object.hash(fileKey, url);

  @override
  String toString() => 'TripImage(fileKey: $fileKey, url: $url)';
}
