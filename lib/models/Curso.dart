// Aqui van los imports hacias las clases que van a usar este Modelo de tabla de BD
// ejemplo:
// import './Yoga_basics.dart o './homescreen.dart'

import 'Category.dart';
import 'Video.dart';

class Curso {
  final String Id;
  final String nombre;
  final String descripcion;
  final String nivel;
  final int weeks;
  final int min;

  List<Video>? videos;

  final Category category;
  Curso({
         required this.Id,
         required this.nombre,
         required this.descripcion,
         required this.nivel,
         required this.weeks,
         required this.min,
         required this.category,
         this.videos
  });

}