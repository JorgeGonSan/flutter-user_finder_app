import 'package:flutter/material.dart';
import 'package:user_finder/services/api_service.dart';
import 'package:user_finder/widgets/my_list_view_builder.dart';

class MyUserFinderScreen extends StatefulWidget {
  const MyUserFinderScreen({super.key});

  @override
  State<MyUserFinderScreen> createState() => _MyUserFinderScreenState();
}

class _MyUserFinderScreenState extends State<MyUserFinderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      futuro Builder pasamos la funcion futura y miramos que tal va, la carga
      el snapshot tiene esa informacion
      */
      body: FutureBuilder(
        future: ApiService.cargarUsuarios(),
        builder: (context, snapshot) {
          //si hasError msg algo a fallado
          if (snapshot.hasError) {
            return Center(child: Text("Algo a fallado"));
          }
          //Si no a acabado, muestro circulo de progresión
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          //Si hay datos, muestro todo cargado
          if (snapshot.hasData) {
            return MyListViewBuilder(usuarios: snapshot.data);
          }
          //Si todo lo demas falla, muesto msg
          return Center(child: Text("Nada a mostrar"));
        },
      ),
    );
  }
}
