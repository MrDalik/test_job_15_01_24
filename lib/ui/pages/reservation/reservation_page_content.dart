import 'package:flutter/cupertino.dart';
import 'package:test_job_15_01_24/model/reservation_model.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget_library_reservation.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class ReservationPageContent extends StatelessWidget {
  final ReservationModel model;
  const ReservationPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitlePage(text: 'Бронирование'),
        const SizedBox(height: 8,),
        StandartContener(child: HotelBlock(rating: model.horating, ratingName: model.ratingName, name: model.hotelName, adress: model.hotelAdress,)),
      ],
    );
  }
}
