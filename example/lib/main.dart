import 'package:flutter/material.dart';
import 'package:versatile_calculator/versatile_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoCalculatorScreen(),
    );
  }
}


class DemoCalculatorScreen extends StatelessWidget {
  const DemoCalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red[800]!,
            side: BorderSide(
              width: 1.0,
              color: Colors.red[800]!,
            ),
            onPrimary: Colors.white,
            elevation: 5,
          ),
          onPressed: (){
            showDialog(
                barrierColor: Colors.white.withOpacity(0.2),
                barrierDismissible: true,
                context: context,
                builder: (ctx) {
                  return VersatileCalculator();
                });
          },

          child: Text('Check Calculator'),
        ),
      ),
    );
  }
}