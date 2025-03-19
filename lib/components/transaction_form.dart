import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleContoller = TextEditingController();

  final valueContoller = TextEditingController();

  _submitForm() {
    final title = titleContoller.text;
    final value = double.tryParse(valueContoller.text) ?? 0.0;
    //chamar o onSubmit para passar os valores para o pai
    if (title.isEmpty || value <= 0) {
      return;
    }
     widget.onSubmit(title, value);
  }

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
              onSubmitted: (value) => _submitForm(),
              // keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: valueContoller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => _submitForm(),
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Text('Nova Transação'),
                  onPressed: _submitForm,
                  style: TextButton.styleFrom(foregroundColor: Colors.purple),
                  // style: ButtonStyle(
                ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
