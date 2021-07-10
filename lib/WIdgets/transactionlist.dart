import 'package:flutter/material.dart';
import 'package:own_expenditure/Models/transaction.dart';
import '../Models/transaction.dart';
import 'transaction_Item.dart';

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
                return TransactionItem(txList: ls[index], fn: fn);
              },
            ),
          );
  }
}
