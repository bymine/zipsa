import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff6042F8),
        child: const Center(
          child: Text(
            "ZIPSA",
            style: TextStyle(
                color: Colors.white, fontStyle: FontStyle.italic, fontSize: 48),
          ),
        ),
      ),
    );
  }
}
