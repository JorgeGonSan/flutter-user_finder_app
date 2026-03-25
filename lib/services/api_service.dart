import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:user_finder/models/usuario.dart';

class ApiService {
  /*Cargaré usuarios no ya ero lo hare y devolvere una lista de usuarios...Future
  static podemos llamar sin crear instancias Apiservice.
  */

  static Future<List<Usuario>> cargarUsuarios() async {
    List<Usuario> usuarios = [];

    //asigno URL y lo parseo a una dirrecion
    final url = Uri.parse('https://randomuser.me/api/?results=100');

    /*
    Hago llamada a la direccion http.get(url) y espero en segundo
    plano la respuesta await
    */
    final respuesta = await http.get(url);

    //Si la respuesta es 200 es que todo ha ido bien
    if (respuesta.statusCode == 200) {
      /*
      Uso el traductor jsonDecode con la respuesta.body que en este momento 
      es un String de una sola linea sin formato y lo convierte en un Mapa,ese
      mapa lo asigno a respuestaMapa
      */
      Map<String, dynamic> respuestaMapa = jsonDecode(respuesta.body);

      /*
      cogemos del mapa solo los datos que nos son importantes, todo lo que hay dentro
      de 'results' y lo guardamos como una lista, aqui tenemos la lista de ususarios
      */
      List<dynamic> listaDeMapas = respuestaMapa['results'];

      /*
      Creamos una lista del tipo Usuario, con la listaDeMapas.map itera por cada mapa
      de la lista, por cada mapa usamos el factory del modelo usuario y lo asignamos como una 
      lista.
      */
      usuarios = listaDeMapas
          .map((unMapa) => Usuario.fromJson(unMapa))
          .toList();
    } else {
      throw Exception("Error al cargar usuarios");
    }
    return usuarios;
  }
}
