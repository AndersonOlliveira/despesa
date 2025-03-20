import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/transection.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child:
          transactions.isEmpty
              ? Column(
                children: <Widget>[
                  SizedBox(height: 20),

                  Text(
                    "Nenhuma Transação Cadastrada",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 20),

                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
              : ListView.builder(
                itemBuilder: (ctx, index) {
                  final tr = transactions[index];
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            //INTERPOLAÇÃO DE STRING
                            'R\$  ${tr.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tr.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat('d MMM y').format(tr.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: transactions.length,
                // children: transactions.map((tr) {}).toList(),
              ),
    );
  }
}

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  // definir o construtor
  // this atributos nomeados
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}
