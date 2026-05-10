import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import '../models.dart';

class SegmentBottomSheet extends StatefulWidget {
  final int segmentIndex;
  final Trip trip;
  final void Function(GSegmentTypeEnum) onTypeChanged;

  const SegmentBottomSheet({
    Key? key,
    required this.segmentIndex,
    required this.trip,
    required this.onTypeChanged,
  }) : super(key: key);

  @override
  State<SegmentBottomSheet> createState() => _SegmentBottomSheetState();
}

class _SegmentBottomSheetState extends State<SegmentBottomSheet> {
  late GSegmentTypeEnum _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.trip.segments[widget.segmentIndex].type;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Poignée
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            'Type du segment ${widget.segmentIndex + 1}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: GSegmentTypeEnum.values.map((type) {
                final selected = _selectedType == type;
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedType = type);
                    widget.onTypeChanged(type);
                  },
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: selected ? type.color.withOpacity(0.2) : null,
                      border: Border.all(
                        color: selected ? type.color : Colors.grey[300]!,
                        width: selected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(type.icon, color: type.color, size: 28),
                        const SizedBox(height: 4),
                        Text(
                          type.label,
                          style: TextStyle(
                            fontSize: 11,
                            color: selected ? type.color : Colors.black87,
                            fontWeight: selected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
