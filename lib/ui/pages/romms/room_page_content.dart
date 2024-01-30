import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_job_15_01_24/model/room_model.dart';

class RoomPageContent extends StatelessWidget {
  final RoomModel model;

  const RoomPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.decimalPattern('ru_RU');
    return SingleChildScrollView(
      child: Text(model.rooms[1].name),
    );
  }
}
