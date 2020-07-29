import 'package:Expense/add_transcation.dart';
import 'package:Expense/model/transcation.dart';
import 'package:Expense/transcation_list.dart';
import 'package:flutter/material.dart';

class UserTranscation extends StatefulWidget {
  @override
  _UserTranscationState createState() => _UserTranscationState();
}

class _UserTranscationState extends State<UserTranscation> {
  final List<Transcation> transcations = [
    Transcation(id: "1", title: "Food", amount: 500, date: DateTime.now()),
    Transcation(id: "2", title: "Fruit", amount: 1000, date: DateTime.now()),
  ];

  _addNewTranscation(String title, double amount) {
    Transcation newTranscation = Transcation(title: title , amount: amount ,date: DateTime.now() , id:DateTime.now().toString() );
    setState(() {
      transcations.add(newTranscation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTranscation(_addNewTranscation),
        TranscationList(transcationList: transcations),
      ],
    );
  }
}
