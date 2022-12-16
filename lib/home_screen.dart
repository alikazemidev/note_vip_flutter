import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input = 'empty';
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('home Page note app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
              ),
              Text(
                input,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    input = controller.text;
                  });
                },
                child: Text('read from text field'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
