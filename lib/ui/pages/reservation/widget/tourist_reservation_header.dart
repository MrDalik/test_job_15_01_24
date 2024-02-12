import 'package:flutter/material.dart';

enum TouristReservationHeaderType { add, expand }

class TouristReservationHeader extends StatelessWidget {
  final String text;
  final TouristReservationHeaderType type;
  final VoidCallback onPressed;
  final bool rotated;

  const TouristReservationHeader({
    super.key,
    required this.text,
    required this.type,
    required this.onPressed,
    this.rotated = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
          TouristReservationHeaderType.add => _AddIcon(onPressed: onPressed),
          TouristReservationHeaderType.expand => _ExpandIcon(
              onPressed: onPressed,
              rotated: rotated,
            ),
        },
      ],
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
        borderRadius: BorderRadius.circular(6),
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
  final bool rotated;

  const _ExpandIcon({required this.onPressed, required this.rotated});

  @override
  Widget build(BuildContext context) {
    return _BaseIcon(
      onPressed: onPressed,
      color: const Color(0xff0D72FF).withOpacity(0.1),
      icon: AnimatedRotation(
        duration: const Duration(milliseconds: 300),
        turns: rotated ? 0.75 : 0.25,
        child: const Icon(Icons.chevron_right, color: Color(0xff0D72FF)),
      ),
    );
  }
}
