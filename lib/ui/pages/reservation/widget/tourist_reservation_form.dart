import 'package:flutter/material.dart';
import 'package:test_job_15_01_24/ui/my_mask_text_input_formatter.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget/tourist_reservation_item.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/widget/tourist_reservation_text_field.dart';
import 'package:test_job_15_01_24/ui/validators.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class TouristReservationForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final int itemCount;

  const TouristReservationForm({
    super.key,
    required this.formKey,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          StandardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Информация о покупателе',
                  style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      height: 26.4 / 22,
                      color: Color(0xff000000)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TouristReservationTextField(
                  label: 'Номер телефона',
                  validator: phoneValidator,
                  inputFormatters: [
                    PhoneMaskTextInputFormatter(),
                  ],
                ),
                const SizedBox(height: 8),
                const TouristReservationTextField(
                  label: 'Почта',
                  validator: emailValidator,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 16.8 / 14,
                    color: Color(0xff828796),
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(
            itemCount,
            (index) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TouristReservationItem(index: index),
            ),
          ),
        ],
      ),
    );
  }
}
