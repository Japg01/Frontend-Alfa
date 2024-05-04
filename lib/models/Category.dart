// Aqui van los imports hacias las clases que van a usar este Modelo de tabla de BD
// ejemplo:
// import './Yoga_basics.dart o './homescreen.dart'

class Category {
  final String Id;
  String nombre;
  String descripcion;

  Category({
          required this.Id,
          required this.nombre,
          required this.descripcion
  });

}