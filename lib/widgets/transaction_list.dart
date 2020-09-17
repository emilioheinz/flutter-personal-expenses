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
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  '\$${t.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    DateFormat.yMMMMd().format(t.date),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
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
