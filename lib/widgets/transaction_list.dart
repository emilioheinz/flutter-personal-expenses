import 'package:PersonalExpenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  Widget _renderContent(BuildContext context) {
    if (transactions.isEmpty) {
      return Column(
        children: [
          Text(
            'No transactions added yet!',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 20),
          Container(
            height: 300,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        Transaction t = transactions[index];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          elevation: 5,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(child: Text('\$${t.amount}')),
              ),
            ),
            title: Text(
              t.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(t.date),
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: 350, child: _renderContent(context));
  }
}
