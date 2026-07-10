import 'package:intl/intl.dart';

class HumanFormats {
  //Se declara static para no generar una instancia para poder llamar uno de sus metodos
  static String humanReadbleNumber(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: ''
    ).format(number);

    return formatterNumber;
  }
}
