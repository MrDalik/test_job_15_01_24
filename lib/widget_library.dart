import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliderImage extends StatefulWidget {
  final List<String> imageUrls;

  const SliderImage({
    super.key,
    required this.imageUrls,
  });

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  final control = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    control.addListener(setindex);
  }

  @override
  void dispose() {
    control.removeListener(setindex);
    super.dispose();
  }

  void setindex() {
    setState(() {
      currentIndex = control.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomCenter, children: [
      PageView(
        controller: control,
        children: widget.imageUrls
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
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFFFFFFF)),
              child: DotPage(
                lenghtDot: widget.imageUrls.length,
                currentIndex: currentIndex,
              )),
          const SizedBox(
            height: 8,
          )
        ],
      )
    ]);
  }
}

class DotPage extends StatelessWidget {
  final int lenghtDot;
  final int currentIndex;

  const DotPage(
      {super.key, required this.lenghtDot, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        lenghtDot,
        (index) => Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index
                  ? const Color(0xFF000000)
                  : Colors.white),
        ),
      ),
    );
  }
}

//SingleChildScrollView

class TitlePage extends StatelessWidget {
  final String textRating;
  final bool beakbutton;

  const TitlePage({
    super.key,
    required this.textRating,
    this.beakbutton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      if (beakbutton) const BackButton(),
      Center(
        child: Text(textRating,
            maxLines: 1,
            style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 21.6 / 18,
            )),
      )
    ]);
  }
}

Widget HotelRating(BuildContext context, int rating) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: const Color(0x33FFC700)),
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
class TravelButton extends StatelessWidget {
  final String textbutton;

  const TravelButton({super.key,required this.textbutton});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff0D72FF),
              padding: const EdgeInsets.all(15.0),
              textStyle: const TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
            },
            child:  Text(
              textbutton,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                height: 17.6 / 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

