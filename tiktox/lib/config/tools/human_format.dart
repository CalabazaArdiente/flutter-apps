import 'package:intl/intl.dart';

class HumanFormat {
  static String humanReadbleFormat(double number) {
    final formatedNum =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
            .format(number);
    return formatedNum;
  }
}
