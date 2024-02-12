import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TouristReservationTextField extends StatelessWidget {
  final String label;
  final FormFieldValidator<String>? validator;

  final List<TextInputFormatter>? inputFormatters;

  const TouristReservationTextField({
    super.key,
    required this.label,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: label,
        fillColor: const Color(0xffF6F6F9),
        filled: true,
      ),
    );
  }
}
