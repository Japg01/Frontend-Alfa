import 'package:flutter/material.dart';
import 'package:alfa_soyzen/widgets/navegation.dart';
import 'package:alfa_soyzen/widgets/sidebarmenu.dart';
import 'package:alfa_soyzen/widgets/progressbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<Map<String, String>> obtenerDatosUsuario() async {
    // Aquí es donde se haría la llamada al Back para obtener los datos del usuario.
    await Future.delayed(const Duration(seconds: 2));
    return {
      'nombreUsuario': 'Nombre de Ejemplo',
      'idUsuario': 'ID de Ejemplo',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(210),
        child: Container(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: FutureBuilder<Map<String, String>>(
                      future: obtenerDatosUsuario(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Map<String, String>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          child: const Text('Mañana',
                              style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          child: const Text('Hoy',
                              style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          child: const Text('Ayer',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () {
                          if (_scaffoldKey.currentState?.isDrawerOpen ??
                              false) {
                            _scaffoldKey.currentState?.openDrawer();
                          } else {
                            _scaffoldKey.currentState?.openDrawer();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: MiScaffold(
        body: ListView(
          children: <Widget>[
            const ProgressSection(),
            buildSection('Categoria de Yoga', 70, 70),
            buildSection('Procesos Populares', 130, 120),
            buildSection('Videos de Cursos', 200, 140),
            buildSection('Nuestros últimos Blogs', 160, 210),
            buildSection('Consejos y temas', 130, 120),
          ],
        ),
      ),
      drawer: const SideBarMenu(),
    );
  }
}

Widget buildSection(String title, double itemWidth, double itemHeight) {
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Ver más',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: itemHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: itemWidth,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.transparent,
                  ),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        print('Item $index presionado');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Image.network(
                                'https://via.placeholder.com/150',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('Item $index'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[200],
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ],
    ),
  );
}
