import 'package:Expense/chartbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/transcation.dart';

class Chart extends StatelessWidget {

  final List<Transcation> recentTranscation;
  Chart({this.recentTranscation});

  String get name => "tej";
  List<Map<String ,dynamic>> get groupedTranscation  {
    return List.generate(7, (index ) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0 ; 
      for(var i =0 ;i<recentTranscation.length;i++) {
        if(recentTranscation[i].date.day== weekDay.day && recentTranscation[i].date.month == weekDay.month && recentTranscation[i].date.year == weekDay.year){
          totalSum += recentTranscation[i].amount;
        }
      }

      return { "day" : DateFormat.E().format(weekDay).substring(0,1), "amount" : totalSum }; 
    }).reversed.toList();

  }

  double get maxSpendingamount { 
    return groupedTranscation.fold(0.0 , (sum , item) { return sum + item['amount']; });
    
  }

  @override
  Widget build(BuildContext context) {
    
    return Card(

        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    
    children: groupedTranscation.map((data) {
      print(data["amount"] );
      // print((data["amount"] )/ maxSpendingamount);
      // return Text(data["day"] + data["amount"].toString());
      return ChartBar(label: data["day"], spendingAmount: data["amount"], spendingPcOfTable: maxSpendingamount == 0.0 ?  0.0 : (data["amount"] as double) / maxSpendingamount);
    }).toList(),
        ),
      );
  }
}
