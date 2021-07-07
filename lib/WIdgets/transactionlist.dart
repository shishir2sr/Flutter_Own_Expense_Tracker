import 'package:flutter/material.dart';
import 'package:own_expenditure/Models/transaction.dart';
import 'package:intl/intl.dart';

class transactionList extends StatelessWidget {
  final List<Transactions> ls;
  transactionList(this.ls);

  @override
  Widget build(BuildContext context) {
    return ls.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Transaction added!!',
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  width: 350,
                  child: Image.asset(
                    'Assets/Images/Empty.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        : Container(
            height: 185,
            child: ListView.builder(
              itemCount: ls.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                  elevation: 4,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade400,
                      radius: 35,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FittedBox(
                          child: Text(
                            '${ls[index].amount}৳',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    title: Text(ls[index].title),
                    subtitle: Text(DateFormat.yMMMMd().format(ls[index].date)),
                  ),
                );
              },
            ),
          );
  }
}
