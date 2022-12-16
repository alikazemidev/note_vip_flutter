import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_screen.dart';

void main() async{
    await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

