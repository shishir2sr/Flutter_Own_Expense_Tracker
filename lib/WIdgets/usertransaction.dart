import 'package:flutter/material.dart';
import 'transactionlist.dart';
import 'newtransaction.dart';
import '../Models/transaction.dart';

class userTransaction extends StatefulWidget {
  userTransaction({Key key}) : super(key: key);

  @override
  _userTransactionState createState() => _userTransactionState();
}

class _userTransactionState extends State<userTransaction> {
  List<Transactions> _userTransactions = [];
  void _newUserTransaction(String txTitle, double txAmount) {
    final newTx = Transactions(
        title: txTitle, amount: txAmount, date: DateTime.now(), Id: 'ididid');
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        newTransaction(_newUserTransaction),
        transactionList(_userTransactions)
      ],
    );
  }
}
