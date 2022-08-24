import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List commandList = ["ROCK", "PAPER", "SCISSORS", "SHOOT!"];

  var _timer;
  int timeTracker = 4; // == commandList.length to dissatisfy if condition of startTimer
  int rpsTracker = 3; // to display $commandList[3].png

  playGame() {
    if (timeTracker < commandList.length)
    {
      return Center(
        child: Text("${commandList[timeTracker]}",
        style: TextStyle(fontSize: 40, color: Colors.pink))
      );
    }
    else{
      return Image.asset("images/${commandList[rpsTracker]}.PNG");
    }
  }

  void startTimer()
  {
    const onePeriod = Duration(milliseconds: 350);
    timeTracker = 0;
    _timer = Timer.periodic(onePeriod,
    (Timer timer) => setState(
      () {
        if (timeTracker < commandList.length){
          timeTracker += 1;
        }
        else{
          timer.cancel();
        }
      }
    )
    );
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(title: Text("Rock Paper Scissors App"),
        backgroundColor: Colors.pink),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                child: playGame()
              ),
              TextButton(
                onPressed: () {
                  startTimer();
                  setState(() {
                    rpsTracker = Random().nextInt(3);
                  });
                }, 
                child: Text("Play", 
                style: TextStyle(
                  color: Colors.pinkAccent, fontSize: 24)
                  )
              ),
            ]
          ),
        )
      ),
    );
  }
}