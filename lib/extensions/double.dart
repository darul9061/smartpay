

import 'package:intl/intl.dart';

extension SmartpayDouble on double {


  String readableNum(){

    NumberFormat formatter = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 2,
    );

    return formatter.format(this);

  }

}