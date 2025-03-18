// import 'dart:ffi';

// import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'package:expenses/components/transaction_user.dart';
import 'package:expenses/components/transaction_list.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyhomePage());
  }
}

class MyhomePage extends StatelessWidget {
  //criando variavel para chamar a classe transection

  // String? title;
  // double? value;

  //aqui vou chamar o transition criado

  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        backgroundColor: const Color.fromARGB(255, 199, 119, 44),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            // width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("grafico"),
              elevation: 5,
            ),
          ),
          TransactionUser(),

          // Card(child: Text("Lista de transações")),
        ],
      ),
    );
  }
}
