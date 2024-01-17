import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SliderImage(BuildContext context) {
  return PageView(
    children: [
      'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg',
      'https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg',
    ]
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

Widget TitlePage(BuildContext context, String text) {
  return Text(
    text,
    maxLines: 1,
    style: const TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
      fontSize: 18,
      height: 21.6 / 18, // в фигме Line height
    ),
  );
}

Widget HotelRating(BuildContext context, int rating) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: Colors.amber[100]),
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
      color: Color(0xFFA80000)),
        ),
      ],
    ),
  );
}
