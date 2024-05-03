// Aqui van los imports hacias las clases que van a usar este Modelo de tabla de BD
// ejemplo:
// import './Yoga_basics.dart o './homescreen.dart'

import 'Category.dart';

class Blog {
  final String Id;
  final String titulo;
  final String descripcion;
  final String imagenUrl;
  final Category category;

  Blog({
        required this.Id,
        required this.titulo,
        required this.descripcion,
        required this.imagenUrl,
        required this.category
  });

}