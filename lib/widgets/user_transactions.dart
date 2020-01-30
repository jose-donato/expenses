import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction("t1", "New shoes", 69.99, DateTime.now()),
    Transaction("t2", "Bananas", 20, DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final time = DateTime.now();
    //TODO: change id after
    final newTx = Transaction(time.toString(), txTitle, txAmount, time);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
