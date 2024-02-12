import 'package:email_validator/email_validator.dart';

String? notEmptyValidator(String? text) {
  if (text == null || text.isEmpty) return 'Поле не должно быть пустым';

  return null;
}

String? emailValidator(String? email) {
  if (email == null || !EmailValidator.validate(email)) return 'Невалидный email';

  return null;
}

String? phoneValidator(String? phone) {
  final phoneDigits = phone?.replaceAll(RegExp(r'\D'), '');
  if (phoneDigits == null || phoneDigits.length != 11 || !phoneDigits.startsWith('7')) return 'Невалидный телефон';

  return null;
}
