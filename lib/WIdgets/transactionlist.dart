import 'package:flutter/material.dart';
import 'package:own_expenditure/Models/transaction.dart';
import 'package:intl/intl.dart';

class transactionList extends StatelessWidget {
  final List<Transactions> ls;
  transactionList(this.ls);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ls
          .map((tx) => Card(
                shadowColor: Colors.grey,
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 5, 35, 5),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        tx.amount.toString() + '৳',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.orange,
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(DateFormat.yMd().format(tx.date),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey))
                      ],
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
