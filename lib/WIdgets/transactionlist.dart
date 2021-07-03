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
                // //Card(
                //   shadowColor: Colors.grey,
                //   elevation: 2,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.fromLTRB(15, 5, 35, 5),
                //         padding: EdgeInsets.all(8),
                //         child: Text(
                //           ls[index].amount.toStringAsFixed(2) + '৳',
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold),
                //         ),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(5),
                //           border: Border.all(
                //             color: Colors.orange,
                //             style: BorderStyle.solid,
                //             width: 1,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             ls[index].title,
                //             style: TextStyle(
                //                 fontSize: 16, fontWeight: FontWeight.bold),
                //           ),
                //           Text(DateFormat.yMd().format(ls[index].date),
                //               style: TextStyle(
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.grey))
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
            ),
          );
  }
}
