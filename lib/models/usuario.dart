class Usuario {
  final String nombre;
  final String email;
  final String ciudad;
  final String urlAvatar;

  const Usuario({
    required this.nombre,
    required this.email,
    required this.ciudad,
    required this.urlAvatar,
  });

  factory Usuario.fromJson(Map<String, dynamic> datosjson) {
    final firstNameApi = datosjson['name']?['first'] ?? 'Sin nombre';
    final lastNameApi = datosjson['name']?['last'] ?? 'sin apellido';
    final fullNameApi = "$firstNameApi $lastNameApi";

    final emailApi = datosjson['email'] ?? 'Sin email';
    final ciudadApi = datosjson['location']?['city'] ?? 'Sin definir';
    final urlAvatarApi = datosjson['picture']?['medium'] ?? 'Sin iamgen';

    return Usuario(
      nombre: fullNameApi,
      email: emailApi,
      ciudad: ciudadApi,
      urlAvatar: urlAvatarApi,
    );
  }
}
