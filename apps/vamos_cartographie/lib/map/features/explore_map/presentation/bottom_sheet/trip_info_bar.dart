import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';

class TripInfoBar extends StatelessWidget {
  final Trip trip;
  const TripInfoBar({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                trip.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
