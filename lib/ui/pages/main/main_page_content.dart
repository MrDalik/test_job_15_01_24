import 'package:flutter/material.dart';
import 'package:test_job_15_01_24/model/hotel_model.dart';
import 'package:test_job_15_01_24/ui/widget/page_title.dart';
import 'package:test_job_15_01_24/widget_%20library.dart';

class MainPageContent extends StatelessWidget {
  final HotelModel model;

  const MainPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageContainerHeight = (screenSize.width - 16 * 2) / 343 * 257;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Center(child: PageTitle(text: "Отель")),
                const SizedBox(height: 15),
                SizedBox(
                  height: imageContainerHeight,
                  child: SliderImage(context),
                ),
                const SizedBox(height: 16),
                HotelRating(context, 5),
                const SizedBox(height: 8),
                TextFormat(context, 'Steigenberger Makadi', 22, 26.4,
                    'SF Pro Display', const Color(0xff000000)),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: TextFormat(
                      context,
                      'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
                      14,
                      16.8,
                      'SF Pro Display',
                      Colors.blue),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormat(context, 'от 134 673 ₽', 30, 36,
                        'SF Pro Display', const Color(0xff000000)),
                    const SizedBox(height: 8),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 14, left: 8),
                      child: TextFormat(context, 'за тур с перелётом', 16, 19.2,
                          'SF Pro Display', const Color(0XFF828796)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffFFFFFF),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextFormat(context, 'Об отеле', 22, 26.4, 'SF Pro Display',
                  const Color(0XFF000000)),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  HashtagFrame(context, '3-я линия'),
                  HashtagFrame(context, 'Платный Wi-Fi в фойе'),
                  HashtagFrame(context, '30 км до аэропорта'),
                  HashtagFrame(context, '1 км до пляжа'),
                ],
              ),
              const SizedBox(height: 12),
              TextFormat(context, model.aboutTheHotel.description, 16, 19.2,
                  'SF Pro Display', const Color(0x90000000)),
              const SizedBox(height: 16),
              HotelInformationFrame(context),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
