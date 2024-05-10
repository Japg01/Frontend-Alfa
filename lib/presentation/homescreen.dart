import 'package:flutter/material.dart';
import 'dart:math';
import 'package:alfa_soyzen/widgets/navegation.dart';
import 'package:alfa_soyzen/widgets/sidebarmenu.dart';
import 'package:alfa_soyzen/widgets/progressbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final BackendService backendService = BackendService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      body: MiScaffold(
        body: ListView(
          children: <Widget>[
            const ProgressSection(),
            buildSection('Categoria de Yoga', 70, 70, 8, backendService),
            buildSection('Procesos Populares', 130, 120, 8, backendService),
            buildSection('Videos de Cursos', 140, 200, 8, backendService),
            buildSection('Nuestros últimos Blogs', 155, 120, 8, backendService),
            buildSection('Consejos y temas', 155, 120, 8, backendService),
          ],
        ),
      ),
      drawer: const SideBarMenu(),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required GlobalKey<ScaffoldState> scaffoldKey})
      : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(210);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final List<String> _days = ['Mañana', 'Hoy', 'Ayer'];
  int _selectedDayIndex = 1; // Por defecto, 'Hoy' está seleccionado
  Future<Map<String, String>> _datosUsuarioFuture;

  @override
  void initState() {
    super.initState();
    _datosUsuarioFuture = obtenerDatosUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF4F14A0), Color(0xFF8066FF)],
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FutureBuilder<Map<String, String>>(
                  future: _datosUsuarioFuture,
                  builder: (BuildContext context,
                      AsyncSnapshot<Map<String, String>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final data = snapshot.data;
                      if (data != null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(data['nombreUsuario'] ?? 'Nombre de Usuario',
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text(data['idUsuario'] ?? 'ID de Usuario',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        );
                      } else {
                        return const Text(
                            'No se pudieron obtener los datos del usuario.');
                      }
                    }
                  },
                ),
              ),
              // El resto de tu código...
            ],
          ),
        ),
      ),
    );
  }
}

Future<Map<String, String>> obtenerDatosUsuario() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String nombreUsuario = prefs.getString('nombreUsuario') ?? '';
  String idUsuario = prefs.getString('idUsuario') ?? '';
  print('nombreUsuario: $nombreUsuario'); // Agrega esta línea
  print('idUsuario: $idUsuario'); // Agrega esta línea
  return {'nombreUsuario': nombreUsuario, 'idUsuario': idUsuario};
}

class BackendService {
  // Simula la obtención de ítems del backend
  List<Map<String, String>> getItems() {
    // Aquí puedes agregar la lógica para obtener los ítems del backend
    // Como no hay conexión, devolvemos una lista de ítems de ejemplo
    return [
      {'image': 'assets/image/no_image_100x100.png', 'title': 'Ítem 1'},
      {'image': 'assets/image/no_image_100x100.png', 'title': 'Ítem 2'},
      {'image': 'assets/image/no_image_100x100.png', 'title': 'Ítem 3'},
      {'image': 'assets/image/no_image_100x100.png', 'title': 'Ítem 4'},
      {'image': 'assets/image/no_image_100x100.png', 'title': 'Ítem 5'},
      {'image': 'assets/image/no_image_100x100.png', 'title': 'Ítem 6'},
      {'image': 'assets/image/no_image_100x100.png', 'title': 'Ítem 7'},
      {'image': 'assets/image/no_image_100x100.png', 'title': 'Ítem 8'},
      // Agrega más ítems aquí...
    ];
  }
}

Widget buildSection(String title, double height, double width, int itemCount,
    BackendService backendService,
    {bool showMoreButton = false}) {
  var items = backendService.getItems(); // Obtenemos los items del backend

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            if (showMoreButton)
              TextButton(
                onPressed: () {
                  // Acción del botón "Ver más"
                },
                child: const Text('Ver más'),
              ),
          ],
        ),
      ),
      SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            var item = items[index];
            String image = item['image'] ?? 'assets/image/no_image_100x100.png';
            String title = item['title'] ?? 'Titulo';

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Navega a otra pantalla
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      SizedBox(
                        width: width,
                        child: FadeInImage(
                          placeholder: const AssetImage(
                              'assets/image/no_image_100x100.png'),
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
