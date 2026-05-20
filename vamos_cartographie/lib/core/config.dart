/// Met à true pour utiliser les données fictives (pas de réseau requis).
/// Met à false pour utiliser le vrai backend GraphQL.
const bool kUseMock = false;

// /// Configuration générale de l'application.
// class AppConfig {
//   /// URL de base pour les images distantes (ex: CDN ou service de photos).
//   final String imageBaseUrl;

//   const AppConfig({required this.imageBaseUrl});

//   /// Retourne l'URL complète d'une image à partir de son [path] (fileKey).
//   String imageUrl(String path) => '$imageBaseUrl$path';
// }
