import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderImage extends StatelessWidget {
  final List<String> imageUrls;

  const SliderImage({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: imageUrls
          .map(
            (imageUrl) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

//SingleChildScrollView

class TitlePage extends StatelessWidget {
  final String textRating;

  const TitlePage(String text, {super.key, required this.textRating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: Row(
        children: [
          Image.asset(
            'assets/icon/vector-3.png',
          ),
          Text(
            textRating,
            maxLines: 1,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 21.6 / 18, // в фигме Line height
            ),
          ),
        ],
      ),
    );
  }
}

Widget HotelRating(BuildContext context, int rating) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: const Color(0x20FFC700)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/icon/Star 22.png',
          width: 15,
          height: 15,
        ),
        const SizedBox(height: 2),
        Text(
          '$rating Превосходно',
          maxLines: 1,
          style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 19.2 / 16,
              color: Color(0xFFFFA800)),
        ),
      ],
    ),
  );
}

Widget TextFormat(BuildContext context, String text, double size,
    double lineHeight, String font, Color colorfont) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w500,
        fontSize: size,
        height: lineHeight / size,
        color: colorfont // в фигме Line height
        ),
  );
}

Widget HashtagFrame(BuildContext context, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: const Color(0xFFFBFBFC)),
    child: Text(
      text,
      maxLines: 1,
      style: const TextStyle(
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          height: 19.2 / 16,
          color: Color(0xFF828796)),
    ),
  );
}

class HotelInformationFrame extends StatelessWidget {
  const HotelInformationFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFFBFBFC)),
        child: Column(
          children: [
            HotelInformation(
                context, "Удобства", 'assets/icon/emoji-happy.svg'),
            const Padding(
              padding: EdgeInsets.only(left: 53 - 15),
              child: Divider(
                color: Color(0X15828796),
              ),
            ),
            HotelInformation(
                context, "Что включено", 'assets/icon/tick-square.svg'),
            const Padding(
              padding: EdgeInsets.only(left: 53 - 15),
              child: Divider(
                color: Color(0X15828796),
              ),
            ),
            HotelInformation(
                context, "Что не включено", 'assets/icon/close-square.svg'),
          ],
        ));
  }
}

Widget HotelInformation(BuildContext context, String text, String image) {
  return Row(
    children: [
      SvgPicture.asset(image),
      const SizedBox(
        width: 12,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormat(context, text, 16, 19.2, 'SF Pro Display',
              const Color(0xFF2C3035)),
          const SizedBox(
            height: 2,
          ),
          TextFormat(context, 'Самое необходимое', 14, 16.8, 'SF Pro Display',
              const Color(0xFF828796)),
        ],
      ),
      const SizedBox(
        width: 120,
      ),
      SvgPicture.asset('assets/icon/Icons.svg'),
    ],
  );
}
