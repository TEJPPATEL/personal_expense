import 'package:flutter/material.dart';

class AddTranscation extends StatefulWidget {

  final Function addNewTranscation;
  AddTranscation(this.addNewTranscation);

  @override
  _AddTranscationState createState() => _AddTranscationState();
}

class _AddTranscationState extends State<AddTranscation> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
          child: Card(
        elevation: 5,
              child: Container(
                // bottom up input softkeyboard up padding to set user input bottom bar
                padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: MediaQuery.of(context).viewInsets.bottom + 50),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        controller: titleInput,
                        decoration: InputDecoration(

                          alignLabelWithHint: true,
                          hintText: "Ex. Medicine",
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          labelText: "Title"
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: amountInput,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: "Ex. 500",
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          labelText: "Amount"
                        ),
                      ),
                      
                      FlatButton(
                        child: Text(
                          "Add Transcation",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          widget.addNewTranscation(titleInput.text , double.parse(amountInput.text));
                          print(amountInput.text);
                          print(titleInput.text);
                          
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}