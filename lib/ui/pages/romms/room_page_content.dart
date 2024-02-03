import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_job_15_01_24/model/room_model.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/reservation_page.dart';
import 'package:test_job_15_01_24/ui/pages/romms/widget_library_room.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class RoomPageContent extends StatelessWidget {
  final RoomModel model;
  final String NamePage;

  const RoomPageContent(
      {super.key, required this.model, required this.NamePage});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          child: TitlePage(
            text: NamePage,
          ),
        ),
        const SizedBox(height: 8),
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
    var format = NumberFormat.decimalPattern('ru_RU');
    return Column(
      children: [
        StandartContener(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SliderImage(
                imageUrls: model.rooms[index].imageUrls,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(model.rooms[index].name,
                  style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    height: 26.4 / 22,
                  )),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: model.rooms[index].peculiarities
                    .map((e) => HashtagFrame(text: e))
                    .toList(),
              ),
              const SizedBox(
                height: 8,
              ),
              const MoreDetailsRoom(),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${format.format(model.rooms[index].price)} ₽',
                    style: const TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        height: 36 / 30,
                        color: Color(0xff000000)),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 14, left: 8),
                    child: Text(
                      model.rooms[index].pricePer,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 19.2 / 16,
                          color: Color(0XFF828796)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const TravelButton(textbutton: "Выбрать номер", page: ReservationPage())
      ],
    );
  }
}
