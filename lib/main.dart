import 'package:flutter/material.dart';
import 'package:test_job_15_01_24/widget_%20library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageContainerHeight = (screenSize.width - 16 * 2) / 343 * 257;
    debugPrint('screenSize: $screenSize');
    debugPrint('imageContainerHeight: $imageContainerHeight');

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:Center( child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              TitlePage(context,"Отель"),
              const SizedBox(height: 15),
              SizedBox(
                height: imageContainerHeight,
                child: SliderImage(context),
              ),
              const SizedBox(height: 16),
              HotelRating(context,5),],
          ),
          ),
        ),
      ),
    );
  }
}
