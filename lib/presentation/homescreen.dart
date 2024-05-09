import 'package:flutter/material.dart';
import 'dart:math';
import 'package:alfa_soyzen/widgets/navegation.dart';
import 'package:alfa_soyzen/widgets/sidebarmenu.dart';
import 'package:alfa_soyzen/widgets/progressbar.dart';

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
                  future: obtenerDatosUsuario(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Map<String, String>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text(
                          'Error al obtener los datos del usuario.');
                    } else {
                      final data = snapshot.data;
                      if (data != null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(data['nombreUsuario'] ?? '',
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text(data['idUsuario'] ?? '',
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
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    height: 30,
                    width: 328,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Buscar',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _days.map((day) {
                    int index = _days.indexOf(day);
                    return Column(
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedDayIndex = index;
                            });
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          child: Text(day,
                              style: TextStyle(
                                  color: _selectedDayIndex == index
                                      ? Colors.white
                                      : Colors.white70)),
                        ),
                        if (_selectedDayIndex == index)
                          Transform.rotate(
                            angle: pi,
                            child: const Icon(Icons.arrow_drop_down,
                                color: Colors.white),
                          )
                      ],
                    );
                  }).toList(),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: const AssetImage(
                      'assets/icons/user.png'), // Esto establecerá la imagen del usuario
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      if (widget._scaffoldKey.currentState?.isDrawerOpen ??
                          false) {
                        widget._scaffoldKey.currentState?.openDrawer();
                      } else {
                        widget._scaffoldKey.currentState?.openDrawer();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Map<String, String>> obtenerDatosUsuario() async {
  // Aquí es donde se haría la llamada al Back para obtener los datos del usuario.
  await Future.delayed(const Duration(seconds: 2));
  return {
    'nombreUsuario': 'Nombre de Ejemplo',
    'idUsuario': 'ID de Ejemplo',
  };
}

class BackendService {
  // Simula la obtención de imágenes del backend
  List<String> getImages() {
    // Aquí puedes agregar la lógica para obtener las imágenes del backend
    // Como no hay conexión, devolvemos una lista vacía
    return [];
  }
}

Widget buildSection(String title, double height, double width, int itemCount,
    BackendService backendService) {
  var images = backendService.getImages();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            // Obtenemos la imagen del backend si está disponible, si no, usamos la imagen por defecto
            String image = images.isNotEmpty
                ? images[index]
                : 'assets/image/no_image_100x100.png';

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // Navega a otra pantalla
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox(
                    width: width,
                    child: FadeInImage(
                      placeholder:
                          const AssetImage('assets/image/no_image_100x100.png'),
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
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
