import 'package:flutter/material.dart';

//Todo add msh checkbox
// import 'package:msh_checkbox/msh_checkbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text('home Page note app'),
        ),
        body: Center(
          child: taskItem(),
        ),
      ),
    );
  }

  Widget taskItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 132,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: taskContent(),
      ),
    );
  }

  Widget taskContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckboxTheme(
                    data: CheckboxThemeData(
                      shape: CircleBorder(),
                      side: BorderSide(
                        width: 1,
                        color: Color(0xff18daa3),
                      ),
                      fillColor: MaterialStatePropertyAll(
                        Color(0xff18daa3),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: ischecked,
                        onChanged: (value) {
                          setState(() {
                            ischecked = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Text('برا امتحان بخونم'),
                ],
              ),
              Text('امتحان زبان انگلیسی'),
              Spacer(),
              editAndTimeBadge(),
            ],
          ),
        ),
        SizedBox(width: 20),
        Image.asset(
          'images/hard_working.png',
        ),
      ],
    );
  }

  Widget editAndTimeBadge() {
    return Row(
      children: [
        Container(
          width: 85,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xff18daa3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 6,
            ),
            child: Row(
              children: [
                Text('10:30'),
                SizedBox(width: 5),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(width: 15),
        Container(
          width: 85,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xffe2f1f6),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Row(
              children: [
                Text(
                  'ویرایش',
                  style: TextStyle(
                    color: Color(0xff18daa3),
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 5),
                Image.asset('images/icon_edit.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
