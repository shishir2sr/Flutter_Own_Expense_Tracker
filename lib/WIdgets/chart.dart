import 'package:flutter/material.dart';
import 'package:own_expenditure/WIdgets/chart_bar.dart';
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

  double get maxSpending {
    return groupedTransactionValues.fold(
        0.0, (sum, element) => sum + element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues
              .map(
                (data) => Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'],
                      data['amount'],
                      maxSpending == 0
                          ? 0.0
                          : (data['amount'] as double) / maxSpending),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
