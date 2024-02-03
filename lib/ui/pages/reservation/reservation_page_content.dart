import 'package:flutter/cupertino.dart';
import 'package:test_job_15_01_24/model/reservation_model.dart';

class ReservationPageContent extends StatelessWidget {
  final ReservationModel model;
  const ReservationPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Text(model.departure);
  }
}
