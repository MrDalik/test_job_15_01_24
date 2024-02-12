import 'package:flutter/material.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget/tourist_reservation_header.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget/tourist_reservation_text_field.dart';
import 'package:test_job_15_01_24/ui/validators.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class TouristReservationItem extends StatefulWidget {
  final int index;

  const TouristReservationItem({super.key, required this.index});

  @override
  State<TouristReservationItem> createState() => _TouristReservationItemState();
}

class _TouristReservationItemState extends State<TouristReservationItem> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return StandardContainer(
      child: Column(
        children: [
          TouristReservationHeader(
            text: '${widget.index + 1}й турист',
            type: TouristReservationHeaderType.expand,
            onPressed: () => setState(() => expanded = !expanded),
            rotated: expanded,
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              height: expanded ? null : 0,
              child: const Column(
                children: [
                  SizedBox(height: 17),
                  TouristReservationTextField(
                    label: 'Имя',
                    validator: notEmptyValidator,
                  ),
                  SizedBox(height: 8),
                  TouristReservationTextField(
                    validator: notEmptyValidator,
                    label: 'Фамилия',
                  ),
                  SizedBox(height: 8),
                  TouristReservationTextField(
                    validator: notEmptyValidator,
                    label: 'Дата рождения',
                  ),
                  SizedBox(height: 8),
                  TouristReservationTextField(
                    label: 'Гражданство',
                    validator: notEmptyValidator,
                  ),
                  SizedBox(height: 8),
                  TouristReservationTextField(
                    label: 'Номер загранпаспорта',
                    validator: notEmptyValidator,
                  ),
                  SizedBox(height: 8),
                  TouristReservationTextField(
                    label: 'Срок действия загранпаспорта',
                    validator: notEmptyValidator,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
