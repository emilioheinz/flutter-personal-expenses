import 'package:PersonalExpenses/widgets/new_transaction.dart';
import 'package:PersonalExpenses/widgets/transaction_list.dart';
import 'package:PersonalExpenses/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                height: 100,
                color: Colors.blue,
                child: Text("CHART"),
              ),
              elevation: 5,
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
