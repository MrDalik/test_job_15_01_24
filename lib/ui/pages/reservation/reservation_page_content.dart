import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:test_job_15_01_24/model/reservation_model.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget/tourist_reservation_add_item.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget/tourist_reservation_form.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget_library_reservation.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class ReservationPageContent extends StatefulWidget {
  final ReservationModel model;

  const ReservationPageContent({super.key, required this.model});

  @override
  State<ReservationPageContent> createState() => _ReservationPageContentState();
}

class _ReservationPageContentState extends State<ReservationPageContent> {
  final _formKey = GlobalKey<FormState>();
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.decimalPattern('ru_RU');
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StandardContainer(
                child: HotelBlock(
              rating: widget.model.horating,
              ratingName: widget.model.ratingName,
              name: widget.model.hotelName,
              adress: widget.model.hotelAdress,
            )),
            const SizedBox(
              height: 8,
            ),
            ReservationBlock(model: widget.model),
            const SizedBox(
              height: 8,
            ),
            TouristReservationForm(formKey: _formKey, itemCount: itemCount),
            const SizedBox(height: 8),
            TouristReservationAddItem(
              onPressed: () => setState(() => itemCount = itemCount + 1),
            ),
            const SizedBox(height: 8),
            Prise(
              tourprice: widget.model.tourPrice,
              fuelcharge: widget.model.fuelCharge,
              servicecharge: widget.model.serviceCharge,
            ),
            const SizedBox(
              height: 8,
            ),
            TravelButton(
              textButton:
                  "Оплатить ${format.format(widget.model.tourPrice + widget.model.fuelCharge + widget.model.serviceCharge)} ₽",
              page: const TitlePage(
                text: "Назад",
              ),
              navigationPredicate: () => _formKey.currentState!.validate(),
            ),
          ],
        ),
      ),
    );
  }
}
