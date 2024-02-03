import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoreDetailsRoom extends StatelessWidget {
  const MoreDetailsRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0x1A0D72FF),
      ),
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Подробнее о номере',
            style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 19.2 / 16,
                color: Color(0xFF0D72FF)),
          ),
         const SizedBox(width: 12,),
         SvgPicture.asset('assets/icon/Vector 55.svg'),
        ],
      ),
    );
  }
}
