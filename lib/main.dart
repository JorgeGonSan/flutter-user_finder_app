import 'package:flutter/material.dart';
import 'package:user_finder/screens/my_user_finder.dart';

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
        body: MyUserFinderScreen(),
      ),
    );
  }
}
