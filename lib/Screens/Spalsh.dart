// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:gamemoonwalk/Screens/PlayGame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const GameMoonWalk(title: 'Game MoonWalk'),
    );
  }
}

class GameMoonWalk extends StatefulWidget {
  const GameMoonWalk({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GameMoonWalk> createState() => _GameMoonWalkState();
}

class _GameMoonWalkState extends State<GameMoonWalk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              Text(
                'MOONWALK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  letterSpacing: 4,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'complete the sentence',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayGame()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Icon(
                    Icons.navigate_next,
                    size: 32,
                  ),
                ),
              ),
              SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}
