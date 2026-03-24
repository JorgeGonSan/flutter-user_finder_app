import 'package:flutter/material.dart';
import 'package:user_finder/models/usuario.dart';

class UserDetailScreen extends StatelessWidget {
  final Usuario userDetail;

  const UserDetailScreen({super.key, required this.userDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
        backgroundColor: Colors.grey[300],
      ),
    );
  }
}
