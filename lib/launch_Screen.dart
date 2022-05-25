import 'package:flutter/material.dart';

class launch_Screen extends StatefulWidget {
  const launch_Screen({Key? key}) : super(key: key);

  @override
  State<launch_Screen> createState() => _launch_ScreenState();
}

class _launch_ScreenState extends State<launch_Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () async {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FCFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/launch.PNG',
          ),
        ],
      ),
    );
  }
}
