import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneMaskTextInputFormatter extends MaskTextInputFormatter {
  PhoneMaskTextInputFormatter({
    super.type,
  }) : super(
          mask: '+# (###) ###-##-##',
          filter: {"#": RegExp(r'[0-9]')},
        );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    final TextEditingValue value;
    if (text.length == 1 &&
        text.startsWith(RegExp(r'\d')) &&
        !newValue.text.startsWith('7')) {
      if (newValue.text.startsWith('8')) {
        value = newValue.copyWith(text: '7');
      } else {
        value = newValue.copyWith(text: '7${newValue.text}');
      }
    } else {
      value = newValue;
    }

    return super.formatEditUpdate(oldValue, value);
  }
}
