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
            ListTile(
              leading: Icon(Icons.map, color: Colors.grey[500]),
              title: Text(
                "${userDetail.ciudad}, ${userDetail.pais}",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.grey[500]),
              title: Text(userDetail.telefono),
              subtitle: Text("Móvil"),
            ),
            ListTile(
              leading: Icon(Icons.mail, color: Colors.grey[500]),
              title: Text(userDetail.email),
              subtitle: const Text("Correo electrónico"),
            ),

            ListTile(
              leading: Icon(
                userDetail.genero == "male"
                    ? Icons.male
                    : userDetail.genero == "female"
                    ? Icons.female
                    : Icons.person_search,
                color: Colors.grey[500],
              ),
              title: Text("${userDetail.edad} años, ${userDetail.genero}"),
              subtitle: Text("Información personal"),
            ),
          ],
        ),
      ),
    );
  }
}
