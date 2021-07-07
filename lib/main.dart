import 'package:flutter/material.dart';
import 'package:own_expenditure/WIdgets/newtransaction.dart';
import 'Models/transaction.dart';
import 'WIdgets/transactionlist.dart';
import 'WIdgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenditure App',
      home: MyHomePage(),
      theme: ThemeData(
        errorColor: Colors.red,
        fontFamily: 'Abril',
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: 'Abril',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10),
            bodyText1: TextStyle(color: Colors.grey),
            bodyText2: TextStyle(
              color: Colors.black,
            )),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transactions> _userTransactions = [];

  void _newUserTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transactions(
        title: txTitle,
        amount: txAmount,
        date: selectedDate,
        Id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransacion(String ID) {
    setState(() {
      _userTransactions.removeWhere((element) => element.Id == ID);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: newTransaction(_newUserTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  List<Transactions> get _recentTransactions {
    return _userTransactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Personal Expenses',
          style: TextStyle(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startNewTransaction(context),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Chart(_recentTransactions),
          transactionList(_userTransactions, _deleteTransacion)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }
}
