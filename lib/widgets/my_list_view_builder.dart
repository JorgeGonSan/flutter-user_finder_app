import 'package:flutter/material.dart';
import 'package:user_finder/models/usuario.dart';
import 'package:user_finder/screens/user_detail_screen.dart';

class MyListViewBuilder extends StatelessWidget {
  final List<Usuario>? usuarios;

  const MyListViewBuilder({super.key, required this.usuarios});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: usuarios?.length,
            itemBuilder: (context, index) {
              Usuario usuario = usuarios![index];
              return Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(usuario.urlAvatar),
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    usuario.nombre,
                                    style: TextStyle(fontSize: 25),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8.0,
                                        ),
                                        child: Icon(Icons.location_city),
                                      ),
                                      Expanded(child: Text(usuario.ciudad)),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          right: 8.0,
                                        ),
                                        child: Icon(Icons.mail),
                                      ),
                                      Expanded(
                                        child: Text(
                                          usuario.email,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            UserDetailScreen(userDetail: usuario),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
