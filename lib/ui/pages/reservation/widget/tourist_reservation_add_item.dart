import 'package:flutter/material.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget/tourist_reservation_header.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class TouristReservationAddItem extends StatelessWidget {
  final VoidCallback onPressed;

  const TouristReservationAddItem({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return StandardContainer(
      child: TouristReservationHeader(
        text: 'Добавить туриста',
        type: TouristReservationHeaderType.add,
        onPressed: onPressed,
      ),
    );
  }
}
