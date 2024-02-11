import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_job_15_01_24/model/hotel_model.dart';
import 'package:test_job_15_01_24/ui/pages/romms/room_page.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class MainPageContent extends StatelessWidget {
  final HotelModel model;

  const MainPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.decimalPattern('ru_RU');
    return Column(
      children: [
        Expanded( child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StandardContainer(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const TitlePage(
                        text: "Отель",
                        backButton: false,
                      ),
                      const SizedBox(height: 15),
                      SliderImage(
                        imageUrls: model.imageUrls,
                      ),
                      const SizedBox(height: 16),
                      HotelBlock(rating: model.rating, ratingName: model.ratingName, name: model.name, adress: model.adress,),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'от ${format.format(model.minimalPrice)} ₽',
                            style: const TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                                height: 36 / 30,
                                color: Color(0xff000000)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 14, left: 8),
                            child: Text(
                              model.priceForIt,
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
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              StandardContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Об отеле',
                        style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            height: 26.4 / 22,
                            color: Color(0XFF000000)),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: model.aboutTheHotel.peculiarities
                          .map((e) => HashtagFrame(text: e))
                          .toList(),
                      // children: List.generate(
                      //   model.aboutTheHotel.peculiarities.length,
                      //   (index) => HashtagFrame(
                      //     text: model.aboutTheHotel.peculiarities[index],
                      //   ),
                      // ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      model.aboutTheHotel.description,
                      style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 19.2 / 16,
                          color: Color(0xE6000000)),
                    ),
                    const SizedBox(height: 16),
                    const HotelInformationFrame(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),),
         TravelButton(
          textbutton: "К выбору номера",
          page: RoomPage(namePage: model.name,),
        ),
      ],
    );
  }
}
