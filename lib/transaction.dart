import 'package:flutter/foundation.dart';

class Transactions {
  String title;
  double amount;
  DateTime date;
  String Id;
  Transactions(
      {@required this.amount,
      @required this.date,
      @required this.title,
      @required this.Id});
}
