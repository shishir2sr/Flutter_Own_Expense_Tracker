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

  bool _showChart = false;

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
    final mQuery = MediaQuery.of(context);
    bool isLandscape = mQuery.orientation == Orientation.landscape;

    var appBar = AppBar(
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
    );

    final txListWidget = Container(
      height: (mQuery.size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          .79,
      child: transactionList(_userTransactions, _deleteTransacion),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart'),
                Switch(
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  },
                )
              ],
            ),
          if (!isLandscape)
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.21,
              child: Chart(_recentTransactions),
            ),
          if (!isLandscape) txListWidget,
          if (isLandscape)
            _showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child: Chart(_recentTransactions),
                  )
                : txListWidget
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
