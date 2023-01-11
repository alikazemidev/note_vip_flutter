import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Text('home Page note app'),
        ),
        body: Center(
          child: Text(
            'علی',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
