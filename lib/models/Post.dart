// Aqui van los imports hacias las clases que van a usar este Modelo de tabla de BD
// ejemplo:
// import './Course.dart o './homescreen.dart'

class Post {
  final String id;
  final String descripcion;
  final String contenido;
  final String imagenURL;
  final String Topico;

  Post({required this.id,
        required this.descripcion,
        required this.contenido,
        required this.imagenURL,
        required this.Topico
  });

}