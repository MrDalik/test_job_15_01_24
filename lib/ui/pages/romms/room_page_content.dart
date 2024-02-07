import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_job_15_01_24/model/room_model.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class RoomPageContent extends StatelessWidget {
  final RoomModel model;

  const RoomPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.decimalPattern('ru_RU');
    return SafeArea(
        child: Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 19, bottom: 16),
          child: const TitlePage(
            text: 'Steigenberger Makadi',
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: model.rooms.length,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
          ),
        )
      ],
    ));
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(
      height: 8,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return StandartContener(
        child: SliderImage(
      imageUrls: model.rooms[index].imageUrls,
    ));
  }
}
