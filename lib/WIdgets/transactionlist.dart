import 'package:flutter/material.dart';
import 'package:own_expenditure/Models/transaction.dart';
import 'package:intl/intl.dart';

class transactionList extends StatelessWidget {
  final List<Transactions> ls;
  final Function fn;
  transactionList(
    this.ls,
    this.fn,
  );

  @override
  Widget build(BuildContext context) {
    return ls.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'No Transaction added!!',
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: constraints.maxHeight * .5,
                    width: constraints.maxWidth * 0.7,
                    child: Image.asset(
                      'Assets/Images/Empty.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          })
        : Container(
            // height: 580,
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
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            icon: Icon(Icons.delete),
                            label: Text('Delete'),
                            textColor: Theme.of(context).errorColor,
                            onPressed: () {
                              fn(ls[index].Id);
                            },
                          )
                        : IconButton(
                            color: Theme.of(context).errorColor,
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              fn(ls[index].Id);
                            },
                          ),
                  ),
                );
              },
            ),
          );
  }
}
