import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.txList,
    @required this.fn,
  }) : super(key: key);

  final txList;
  final Function fn;

  @override
  Widget build(BuildContext context) {
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
                '${txList.amount}৳',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(txList.title),
        subtitle: Text(DateFormat.yMMMMd().format(txList.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () {
                  fn(txList.Id);
                },
              )
            : IconButton(
                color: Theme.of(context).errorColor,
                icon: Icon(Icons.delete),
                onPressed: () {
                  fn(txList.Id);
                },
              ),
      ),
    );
  }
}
