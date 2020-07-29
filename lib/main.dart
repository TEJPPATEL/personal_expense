import 'package:Expense/restdata.dart';
import 'package:Expense/sample_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'chart.dart';
import 'home.dart';
import 'model/screen1.dart';
import 'model/screen2.dart';

void main(){

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp , DeviceOrientation.portraitDown ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     title : "Personal Expense",
     theme: ThemeData(
       primarySwatch: Colors.green,
     ),
    //  initialRoute: '/',
     home: SampleScreen(),
    //  routes: {
    //    '/':(context) => RestData(),
    //    '/first':(context) => Screen1(),
    //    '/second':(context) => Screen2()
    //  },
    );
  }
}
