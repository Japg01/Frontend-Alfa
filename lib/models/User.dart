// Aqui van los imports hacias las clases que van a usar este Modelo de tabla de BD
// ejemplo:
// import './Course.dart o './homescreen.dart'

import 'Curso.dart';
import 'Notify.dart';

class User {
  final String id;
  String email;
  String password;
  String name;
  String phone;

  //vvv Ojo se puede cambiar a Widgets en vez de tipos de datos!,
  //vvv lo mas probable se esto se cambie pronto.
  String urlImagenPerfil;
  List<String>? urlsGalery;
  List<User>? followers;

  List<User>? followings;
  List<Curso>? myTraining;
  List<Notify>? inbox;


  User({required this.id,
        required this.email,
        required this.password,
        required this.name,
        required this.phone,
        required this.urlImagenPerfil,
        this.urlsGalery,
        this.followers,
        this.followings,
        this.inbox,
        this.myTraining
  });

}