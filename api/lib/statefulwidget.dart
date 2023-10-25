import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';



class MyLogin extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<MyLogin> {
  double myPercent = 0.0;
  int myHour = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    const totalHours = 24;
    const timerInterval = Duration(seconds: 3); // Adjust as needed
    int currentHour = 1;

    Timer.periodic(timerInterval, (timer) {
      setState(() {
        myPercent = (currentHour % totalHours) / totalHours;
        myHour = currentHour % totalHours;
        currentHour++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("STATEFUL > STATELESS"),
        ),
        body: Directionality(
          textDirection: TextDirection.ltr, // Adjust as needed
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircularPercentIndicator(
                radius: 130.0,
                animation: true,
                animationDuration: 1000,
                lineWidth: 15.0,
                percent: myPercent,
                center: Text(
                  "$myHour hours",
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.blue,
                progressColor: Colors.white,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Text("THIS IS BUTTON"),
      ),
    );
  }
}