import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addHandler;
  NewTransaction(@required this.addHandler);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addHandler(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => _submitData,
                //onChanged: (val) => titleInput = val,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData,
                /*onChanged: (val) {
                        amountInput = val;
                      },*/
              ),
              FlatButton(
                child: Text(
                  'Add Transaction',
                ),
                onPressed: _submitData,
                textColor: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
