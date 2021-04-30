import 'package:flutter/material.dart';
import 'transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  List<Transactions> ls = [
    Transactions(
      date: DateTime.now(),
      title: 'Shopping',
      Id: 'T1',
      amount: 20,
    ),
    Transactions(
      date: DateTime.now(),
      title: 'Life and Entertainment',
      Id: 'T2',
      amount: 20,
    ),
    Transactions(
      date: DateTime.now(),
      title: 'Grocery',
      Id: 'T1',
      amount: 20,
    )
  ];
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            'OWN EXPENDITURE',
            style: TextStyle(),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Center(
                child: Text(
                  'Chart',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              elevation: 5,
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orange, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orange, width: 1.0),
                      ),
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 10.0,
                  ),
                  TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orange, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orange, width: 1.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: ls
                .map((tx) => Card(
                      shadowColor: Colors.orange,
                      elevation: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 25, 5),
                            padding: EdgeInsets.all(8),
                            child: Text(
                              tx.amount.toString(),
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
                                width: 2,
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                tx.title,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(tx.date.toString(),
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
          )
        ],
      ),
    );
  }
}
