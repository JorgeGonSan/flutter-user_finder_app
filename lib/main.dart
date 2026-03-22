import 'package:flutter/material.dart';

void main() {
  runApp(const MyUserFinder());
}

class MyUserFinder extends StatelessWidget {
  const MyUserFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Finder"),
          backgroundColor: Colors.grey[300],
        ),
      ),
    );
  }
}
