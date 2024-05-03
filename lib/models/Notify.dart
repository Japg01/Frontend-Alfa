// Aqui van los imports hacias las clases que van a usar este Modelo de tabla de BD
// ejemplo:
// import './Yoga_basics.dart o './homescreen.dart'

class Notify {
  final String id;
  final String Contenido;
  final DateTime hora_envio;
  final bool leida;

  Notify({required this.id,
          required this.Contenido,
          required this.hora_envio,
          required this.leida
  });

}