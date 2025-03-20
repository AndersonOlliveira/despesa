// ignore: depend_on_referenced_packages
import 'package:expenses/components/chart_bar.dart';
import 'package:intl/intl.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);
  //definr um geter

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekday.day;
        bool sameMonth = recentTransaction[i].date.month == weekday.month;
        bool sameYear = recentTransaction[i].date.year == weekday.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {'day': DateFormat.E().format(weekday)[0], 'value': totalSum};
    });
  }

  //calcular total da semana

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, e) {
      return sum + (e['value'] as double);
    });
  }

  //formatar a data
  // DateFormat.E().formart(weekday)[]
  @override
  Widget build(BuildContext context) {
    // groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              groupedTransactions.map((e) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: e['day'] as String,
                    valor: e['value'] as double,
                    percentage: (e['value'] as double) / _weekTotalValue,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
