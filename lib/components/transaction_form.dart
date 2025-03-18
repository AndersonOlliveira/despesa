import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleContoller = TextEditingController();
  final valueContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      //para criar um formulario e preciso passaar o TextFild dentro de um Column
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleContoller,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: valueContoller,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('Nova Transação'),
                  onPressed: () {
                    print(titleContoller.text);
                    print(valueContoller.text);
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.purple),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
