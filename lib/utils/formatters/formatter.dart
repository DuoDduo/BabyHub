import 'package:intl/intl.dart';

class BabyHubFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat(" dd-MMM-yyy").format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: "en_US", symbol: "\$").format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    //Assuming a 10digit number
    if (phoneNumber.length == 10) {
      return "(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}";
    } else if (phoneNumber.length == 11) {
      return "(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}";
    }
    // add more custom phone number formatting logic for different format
    return phoneNumber;
  }

  static StringBuffer internationalFormatPhoneNumber(String phoneNumber) {
    //remove any non digit character from the number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r"\D"), "");

    //Extract  the country code from the digitsOnly
    String countryCode = " + ${digitsOnly.substring(0, 2)}";
    digitsOnly = digitsOnly.substring(2);

    //Add remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write("($countryCode");
    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == "+1") {
        groupLength = 3;
      }
      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));
      if (end < digitsOnly.length) {
        formattedNumber.write(" ");
      }
      i = end;
    }
    return formattedNumber;
  }
}
