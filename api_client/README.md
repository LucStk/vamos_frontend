<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

Paquet qui permet de faire le lien entre l'app et le backend Django via graphql.
Ferry permet de créer les query et mutation utile pour l'ensemble de l'application.

Avant de lancer la génération, il faut télécharger le schema graphql du backend ->
```get-graphql-schema http://localhost:8000/graphql/ > lib/src/graphql/schema.graphql```
Le client tourne avec ferry generator 2.
Pour lancer la génération automatique des modèles dart :

```dart run build_runner build --delete-conflicting-outputs```

Pour lancer les test
```
dart test
```
