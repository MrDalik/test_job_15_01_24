import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  final String text;
  const PageTitle({super.key, required this.text});

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
            text,
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
