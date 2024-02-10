import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:test_job_15_01_24/model/reservation_model.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget_library_reservation.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class ReservationPageContent extends StatelessWidget {
  final ReservationModel model;

  const ReservationPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.decimalPattern('ru_RU');
    return Expanded(
      child: SingleChildScrollView(padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StandartContener(
                child: HotelBlock(
              rating: model.horating,
              ratingName: model.ratingName,
              name: model.hotelName,
              adress: model.hotelAdress,
            )),
            const SizedBox(
              height: 8,
            ),
            ReservationBlock(
              departure: model.departure,
              arrivalcountry: model.arrivalCountry,
              tourdatestart: model.tourDateStart,
              tourdatestop: model.tourDateStop,
              numberofnights: model.numberOfNights,
              room: model.room,
              nutrition: model.nutrition,
              hotelname: model.hotelName,
            ),
            const SizedBox(
              height: 8,
            ),
            Regisration(),
            const SizedBox(
              height: 8,
            ),
            Prise(
              tourprice: model.tourPrice,
              fuelcharge: model.fuelCharge,
              servicecharge: model.serviceCharge,
            ),
            const SizedBox(
              height: 8,
            ),
            TravelButton(
                textbutton:
                    "Оплатить ${format.format(model.tourPrice + model.fuelCharge + model.serviceCharge)} ₽",
                page: const TitlePage(
                  text: "Назад",
                ))
          ],
        ),
      ),
    );
  }
}
