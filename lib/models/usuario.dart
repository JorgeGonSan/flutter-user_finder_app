class Usuario {
  final String nombre;
  final String email;
  final String ciudad;
  final String urlAvatar;
  final String telefono;
  final int edad;
  final String genero;
  final String pais;

  const Usuario({
    required this.nombre,
    required this.email,
    required this.ciudad,
    required this.urlAvatar,
    required this.telefono,
    required this.edad,
    required this.genero,
    required this.pais,
  });

  factory Usuario.fromJson(Map<String, dynamic> datosjson) {
    final firstNameApi = datosjson['name']?['first'] ?? 'Sin nombre';
    final lastNameApi = datosjson['name']?['last'] ?? 'sin apellido';
    final fullNameApi = "$firstNameApi $lastNameApi";
    final emailApi = datosjson['email'] ?? 'Sin email';
    final ciudadApi = datosjson['location']?['city'] ?? 'Sin definir';
    final urlAvatarApi = datosjson['picture']?['medium'] ?? 'Sin iamgen';
    final telefonoApi = datosjson['phone'] ?? 'Sin definir';
    final edadApi = datosjson['dob']?['age'] ?? 0;
    final generoApi = datosjson['gender'] ?? "Sin definir";
    final paisApi = datosjson['location']?['country'] ?? 'Sin definir';

    return Usuario(
      nombre: fullNameApi,
      email: emailApi,
      ciudad: ciudadApi,
      urlAvatar: urlAvatarApi,
      telefono: telefonoApi,
      edad: edadApi,
      genero: generoApi,
      pais: paisApi,
    );
  }
}
