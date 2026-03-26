import 'package:flutter/material.dart';
import 'package:user_finder/models/usuario.dart';
import 'package:user_finder/services/api_service.dart';
import 'package:user_finder/widgets/my_list_view_builder.dart';

class MyUserFinderScreen extends StatefulWidget {
  const MyUserFinderScreen({super.key});

  @override
  State<MyUserFinderScreen> createState() => _MyUserFinderScreenState();
}

class _MyUserFinderScreenState extends State<MyUserFinderScreen> {
  String textBuscador = "";
  TextEditingController miController = TextEditingController();
  //Lista con todos los usuarios para realizar busquedas
  List<Usuario> usuariosTotales = [];
  //Lista de solo los filtrados
  List<Usuario> usuariosFiltrados = [];
  bool hayError = false;

  /*
  llamamos al crear la pantalla una unica vez llamamos a la apiService.cargarUsusarios
  que nos devolvera una lista de usuarios en el futuro, entonces (Then) cuando llegue
  copiamos la lista que llego desde la API a la variable usuarios totales y usuarios filttado para
  inicialmente mostrar todos los usuarios.
  Controlamos en el caso de que haya error para mostrarlo
  */
  @override
  void initState() {
    super.initState();

    ApiService.cargarUsuarios()
        .then((listaDeLaApi) {
          setState(() {
            usuariosTotales = listaDeLaApi;
            usuariosFiltrados = listaDeLaApi;
          });
        })
        .catchError((miError) {
          setState(() {
            hayError = true;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              controller: miController,
              onChanged: (value) {
                setState(() {
                  //recorremos usuarios totales
                  final resultado = usuariosTotales.where((usuarioBuscado) {
                    //Por cada usuario cogemos nombre y lo pasamos a minúsculas
                    final nombreUsuario = usuarioBuscado.nombre.toLowerCase();
                    //pasamos el texto del texfield tambien a minúsculas
                    textBuscador = value.toLowerCase();
                    //comprueba si contine el texto buscado
                    return nombreUsuario.contains(textBuscador);
                  }).toList();
                  usuariosFiltrados = resultado;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hint: Text("Buscar"),
              ),
            ),
          ),

          Expanded(
            child: hayError
                ? Center(child: Text("Algo a fallado"))
                : usuariosTotales.isEmpty
                ? Center(child: CircularProgressIndicator())
                : MyListViewBuilder(usuarios: usuariosFiltrados),
          ),
        ],
      ),
    );
  }
}
