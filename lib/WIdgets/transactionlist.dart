import 'package:flutter/material.dart';
import 'package:own_expenditure/Models/transaction.dart';
import 'package:intl/intl.dart';

class transactionList extends StatelessWidget {
  final List<Transactions> ls;
  transactionList(this.ls);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      child: ListView.builder(
        itemCount: ls.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shadowColor: Colors.grey,
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(15, 5, 35, 5),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    ls[index].amount.toString() + '৳',
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
                      ls[index].title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat.yMd().format(ls[index].date),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
