import 'package:flutter/material.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return MiScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildAppBar(),
            buildSection("Mi entrenamiento", 130.0, 120.0),
            buildSection("Mis fotos", 130.0, 120.0),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      height: 200.0,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4F14A0), Color(0xFF8066FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const Row(
              children: [
                CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage('URL_DE_LA_IMAGEN'),
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre de usuario',
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Text('Seguidores: 0',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10.0),
                        Text('Seguidos: 0',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const LinearProgressIndicator(value: 0.5, color: Colors.white),
          ],
        ),
      ),
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

class BarraNavegacion extends StatelessWidget {
  const BarraNavegacion({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/icons/hogar.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/icons/silla.png'),
              onPressed: () {},
            ),
            const SizedBox(width: 48),
            IconButton(
              icon: Image.asset('assets/icons/ajustes.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/icons/campana.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MiScaffold extends StatelessWidget {
  final Widget body;
  const MiScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4F14A0), Color(0xFF8066FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Image.asset('assets/icons/rayo.png',
              color: Colors.white, width: 35.0, height: 35.0),
        ),
      ),
      bottomNavigationBar: const BarraNavegacion(),
    );
  }
}
