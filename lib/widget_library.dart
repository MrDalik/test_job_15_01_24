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
    final screenSize = MediaQuery.of(context).size;
    final imageContainerHeight = (screenSize.width - 16 * 2) / 343 * 257;
    return SizedBox(
      height: imageContainerHeight,
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
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
      ]),
    );
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
  final String text;
  final bool backButton;

  const TitlePage({
    super.key,
    required this.text,
    this.backButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Stack(children: [
        if (backButton)
          Column(children: [
            const SizedBox(height: 19),
            Row(
              children: [
                const SizedBox(width: 23),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.pop(context),
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: SvgPicture.asset('assets/icon/vector-3.svg')),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            )
          ]),
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 19,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48 + 16),
                child: Text(text,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      height: 21.6 / 18,
                    )),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        )
      ]),
    );
  }
}

class HotelRating extends StatelessWidget {
  final String ratingName;
  final int rating;

  const HotelRating(
      {super.key, required this.rating, required this.ratingName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0x33FFC700)),
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
            '$rating $ratingName',
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
}

class HashtagFrame extends StatelessWidget {
  final String text;

  const HashtagFrame({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xFFFBFBFC)),
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
        child: const Column(
          children: [
            HotelInformation(
                text: "Удобства", image: 'assets/icon/emoji-happy.svg'),
            Padding(
              padding: EdgeInsets.only(left: 53 - 15),
              child: Divider(
                color: Color(0X15828796),
              ),
            ),
            HotelInformation(
                text: "Что включено", image: 'assets/icon/tick-square.svg'),
            Padding(
              padding: EdgeInsets.only(left: 53 - 15),
              child: Divider(
                color: Color(0X15828796),
              ),
            ),
            HotelInformation(
                text: "Что не включено", image: 'assets/icon/close-square.svg'),
          ],
        ));
  }
}

class HotelInformation extends StatelessWidget {
  final String text;
  final String image;

  const HotelInformation({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text,
                style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    height: 19.2 / 16,
                    color: Color(0xFF2C3035))),
            const SizedBox(
              height: 2,
            ),
            const Text('Самое необходимое',
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 16.8 / 14,
                    color: Color(0xFF828796))),
          ],
        ),
        const SizedBox(
          width: 120,
        ),
        SvgPicture.asset('assets/icon/Icons.svg'),
      ],
    );
  }
}

class TravelButton extends StatelessWidget {
  final String textButton;
  final Widget page;
  final bool Function()? navigationPredicate;

  const TravelButton({
    super.key,
    required this.textButton,
    required this.page,
    this.navigationPredicate,
  });

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
              if (navigationPredicate?.call() ?? true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              }
            },
            child: Text(
              textButton,
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

class StandardContainer extends StatelessWidget {
  final Widget child;

  const StandardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}

class HotelBlock extends StatelessWidget {
  final int rating;

  final String ratingName;

  final String name;

  final String adress;

  const HotelBlock(
      {super.key,
      required this.rating,
      required this.ratingName,
      required this.name,
      required this.adress});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HotelRating(
        rating: rating,
        ratingName: ratingName,
      ),
      const SizedBox(height: 8),
      Text(
        name,
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
          adress,
          style: const TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 16.8 / 14,
            color: Color(0xFF0D72FF),
          ),
        ),
      ),
    ]);
  }
}
