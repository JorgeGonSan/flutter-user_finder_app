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
      //permite scroll
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 90,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(userDetail.urlAvatar),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                userDetail.nombre,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 8),
            Divider(
              thickness: 1,
              color: Colors.grey[300],
              indent: 50,
              endIndent: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Icon(Icons.location_city, color: Colors.grey[500]),
                  SizedBox(width: 8),
                  Text(userDetail.ciudad),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Icon(Icons.mail, color: Colors.grey[500]),
                  SizedBox(width: 8),
                  Text(userDetail.email, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
