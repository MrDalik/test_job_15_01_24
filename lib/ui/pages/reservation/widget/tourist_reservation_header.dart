import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:test_job_15_01_24/widget_library.dart';

enum TouristReservationHeaderType { add, expand }

class TouristReservationHeader extends StatelessWidget {
  final String text;
  final TouristReservationHeaderType type;
  final VoidCallback onPressed;

  const TouristReservationHeader({
    super.key,
    required this.text,
    required this.type,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return StandardContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                fontSize: 22,
                height: 26.4 / 22,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            switch (type) {
              TouristReservationHeaderType.add =>
                _AddIcon(onPressed: onPressed),
              TouristReservationHeaderType.expand =>
                _ExpandIcon(onPressed: onPressed),
            },
          ],
        ),
      ),
    );
  }
}

class _BaseIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Widget icon;

  const _BaseIcon({
    required this.onPressed,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: 32,
          height: 32,
          child: icon,
        ),
      ),
    );
  }
}

class _AddIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddIcon({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return _BaseIcon(
      onPressed: onPressed,
      color: const Color(0xff0D72FF),
      icon: const Icon(Icons.add, color: Colors.white),
    );
  }
}

class _ExpandIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const _ExpandIcon({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return _BaseIcon(
      onPressed: onPressed,
      color: const Color(0xff0D72FF).withOpacity(0.1),
      icon: Transform.rotate(
        angle: math.pi / 2,
        child: const Icon(Icons.chevron_right, color: Color(0xff0D72FF)),
      ),
    );
  }
}
