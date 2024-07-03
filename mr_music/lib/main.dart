import 'package:flutter/material.dart';
import 'package:mr_music/screens/home_Screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mr.Musician',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomeScreens(),
    );
  }
}
