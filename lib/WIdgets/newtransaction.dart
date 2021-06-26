import 'package:flutter/material.dart';

class newTransaction extends StatefulWidget {
  final Function addTx;
  newTransaction(this.addTx);

  @override
  _newTransactionState createState() => _newTransactionState();
}

class _newTransactionState extends State<newTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: _titleController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1.0),
                ),
                labelText: 'Title',
              ),
              onSubmitted: (_) =>
                  submitData(), //'_' is used to avoid the error 'void function string'//
            ),
            SizedBox(
              width: double.infinity,
              height: 10.0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1.0),
                ),
              ),
              onSubmitted: (_) =>
                  submitData(), //'_' is used to avoid the error 'void function string'//
            ),
            FlatButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
