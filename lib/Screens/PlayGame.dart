// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/Modules/ExtracWidget/WiggetBox.dart';
import 'package:gamemoonwalk/Modules/Question/QuestionItem.dart';
import 'package:gamemoonwalk/Screens/Result.dart';

void main() {
  runApp(const PlayGame());
}

class PlayGame extends StatefulWidget {
  const PlayGame({Key? key}) : super(key: key);

  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  int index = 0;
  int count = 3;
  List<bool> CheckColor = [];
  List<bool> onClicked = [];

  List<Questions> data = [
    Questions(
      question: 'Do you want to ......?',
      answerone: 'do',
      answertwo: 'get',
      answertrue: 'do',
    ),
    Questions(
      question: 'I am ...... TV?',
      answerone: '  going to play',
      answertwo: 'going to watch',
      answertrue: 'going to watch',
    ),
    Questions(
      question: 'It is a ...... day',
      answerone: 'shiny',
      answertwo: 'sunny',
      answertrue: 'sunny',
    ),
    Questions(
      question: 'She ...... on the fence when she fell down',
      answerone: 'was sitting',
      answertwo: 'was catching',
      answertrue: 'was sitting',
    ),
  ];

  List<Widget> renderBox() {
    List<Widget> renderListBox = [];
    for (var i = 0; i < data.length; i++) {
      renderListBox.add(box(
        checkColor: CheckColor[i],
        onClicked: onClicked[i],
      ));
    }
    return renderListBox;
  }

  @override
  void didChangeDependencies() {
    for (var i = 0; i < data.length; i++) {
      CheckColor.add(false);
      onClicked.add(false);
    }
    super.didChangeDependencies();
  }

  void checkRight(String answer) {
    setState(() {
      onClicked[index] = true;
    });
    if (answer == data[index].answertrue) {
      setState(
        () {
          CheckColor[index] = true;
        },
      );
    }else{
      setState(() {
        count--;
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/Asset/moon.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '$count',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                height: 33,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue[500],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    ...renderBox(),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Center(
                child: Text(
                  (index >= data.length)
                      ? data[data.length - 1].question
                      : data[index].question,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (index >= data.length)
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            checkRight(data[index].answerone);
                            setState(() {
                              index++;
                              if (index == data.length) {
                                Timer(Duration(seconds: 3), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result()),
                                  );
                                });
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              data[index].answerone,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                  (index >= data.length)
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            checkRight(data[index].answertwo);
                            setState(() {
                              index++;
                              if (index == data.length) {
                                Timer(Duration(seconds: 3), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Result()),
                                  );
                                });
                              }
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              data[index].answertwo,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
