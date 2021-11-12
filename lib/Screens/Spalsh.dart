// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, deprecated_member_use, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/Modules/Request/Network_Request.dart';
import 'package:gamemoonwalk/Modules/Title/TitleItem.dart';
import 'package:gamemoonwalk/Modules/model/ThemItem.dart';
import 'package:gamemoonwalk/Screens/PlayGame.dart';
import 'package:gamemoonwalk/Modules/Request/Network_Request.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameMoonWalk(title: 'Game MoonWalk'),
    );
  }
}

class GameMoonWalk extends StatefulWidget {
  GameMoonWalk({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GameMoonWalk> createState() => _GameMoonWalkState();
}

class _GameMoonWalkState extends State<GameMoonWalk> {
  // List<ThemeItem> themeData = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   NetworkRequest.fetchPosts().then((dataFromSever) {
  //     setState(() {
  //       themeData = dataFromSever.cast<ThemeItem>();
  //     });
  //   });
  // }

  List<Packet> data = [
    Packet(
      titleSPL: "Activities \n & Events",
      word: "25/25 Words,",
    ),
    Packet(
      titleSPL: "Choices",
      word: "20/20 Words",
    ),
    Packet(
      titleSPL: "Communication",
      word: "20/20 Words",
    ),
    Packet(
      titleSPL: "Describing \n People",
      word: "20/20 Words",
    ),
    Packet(
      titleSPL: "Food & Drink",
      word: "20/20 Words",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/Asset/moon.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var item in data)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlayGame()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 40),
                      alignment: Alignment.topCenter,
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(75),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            // '${themeData[index].name}',
                            item.titleSPL,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            item.word,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
