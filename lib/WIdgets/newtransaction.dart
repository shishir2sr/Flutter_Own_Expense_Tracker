import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class newTransaction extends StatefulWidget {
  final Function addTx;
  newTransaction(this.addTx);

  @override
  _newTransactionState createState() => _newTransactionState();
}

class _newTransactionState extends State<newTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
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
            Row(
              children: [
                Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date choosen!!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}')),
                FlatButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Select a date',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ))
              ],
            ),
            RaisedButton(
              onPressed: submitData,
              color: Colors.teal,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.white,
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
