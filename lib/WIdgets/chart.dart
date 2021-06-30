import 'package:flutter/material.dart';
import '../Models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recenTransactions;

  Chart(this.recenTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      // The subtract() method recieves duration and subtract the duration from present date/hour/year/month etc|
      double totalSUm = 0.0;

      for (var tx in recenTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSUm += tx.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSUm
      }; //Dateformat.E()is a package from intl package. It takes shortcut name of weekday|
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      child: Row(
        children: groupedTransactionValues
            .map(
              (data) => Text(' ${data['day']} : ${data['amount']} '),
            )
            .toList(),
      ),
    );
  }
}
