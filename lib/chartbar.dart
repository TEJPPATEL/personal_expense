// import 'package:Expense/chart.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPcOfTable;

  ChartBar({this.label, this.spendingAmount, this.spendingPcOfTable});

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            child: Text('${spendingAmount.toStringAsFixed(0)}'),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                // Text(spendingPcOfTable.toString()),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // Text(${wspendingPcOfTable}),
                FractionallySizedBox(
                  heightFactor: spendingPcOfTable,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      // border: Border.all(, width: 1.0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05),
          Container(
            height: constraints.maxHeight*0.15,
            child: Text(label))
        ],
      ),
    );
  }
}
