import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/trips/trips.dart';
import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

final Trip t1 = Trip(
  id: Id<Trip>(1),
  title: 'Tour de Bretagne à vélo',
  description:
      'Un grand tour de Bretagne en passant par Rennes, Brest et le long des côtes bretonnes. Paysages grandioses, crêpes et cidre garantis !',
  date: DateTime(2024, 7, 14),
  images: [
    MediaImage(
      fileKey: 'seed/v1',
      url: 'https://picsum.photos/seed/v1/600/400',
    ),
  ],
);

final Trip t2 = Trip(
  id: Id<Trip>(2),
  title: "Route des vins d'Alsace",
  description:
      "La célèbre route des vins entre Strasbourg et Mulhouse, en vélo et à pied, avec des arrêts dans les plus beaux villages alsaciens.",
  date: DateTime(2024, 9, 5),
);

final Trip t3 = // --- Voyage 3 : Traversée des Pyrénées ---
Trip(
  id: Id<Trip>(3),
  title: 'Traversée des Pyrénées',
  description:
      'Un périple épique à vélo à travers les contreforts pyrénéens, de la côte basque jusqu\'aux sommets de Lourdes.',
  date: DateTime(2024, 8, 20),
);
final tripsMockData = [t1, t2, t3];
