import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_job_15_01_24/model/hotel_model.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class MainPageContent extends StatelessWidget {
  final HotelModel model;

  const MainPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageContainerHeight = (screenSize.width - 16 * 2) / 343 * 257;
    var format = NumberFormat.decimalPattern('ru_RU');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StandartContener(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const TitlePage(
                  textRating: "Отель",
                  beakbutton: true,
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: imageContainerHeight,
                  child: SliderImage(
                    imageUrls: model.imageUrls,
                  ),
                ),
                const SizedBox(height: 16),
                HotelRating(
                  rating: model.rating,
                  ratingName: model.ratingName,
                ),
                const SizedBox(height: 8),
                Text(
                  model.name,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      height: 26.4 / 22,
                      color: Color(0xff000000)),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    model.adress,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 16.8 / 14,
                      color: Color(0xFF0D72FF),
                    ),
                  ),
                ),
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
                    const SizedBox(height: 8),
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
        StandartContener(
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
                children: List.generate(
                    model.aboutTheHotel.peculiarities.length,
                    (index) => HashtagFrame(
                        text: model.aboutTheHotel.peculiarities[index])),
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
    );
  }
}
