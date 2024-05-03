import 'package:flutter/material.dart';
import 'package:alfa_soyzen/widgets/navegation.dart';
import 'package:alfa_soyzen/widgets/sidebarmenu.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(230),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4F14A0), Color(0xFF8066FF)],
            ),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Nombre de usuario',
                    style: TextStyle(fontSize: 28, color: Colors.white)),
                const SizedBox(height: 10),
                const Text('ID de usuario',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                const SizedBox(height: 90),
                Container(
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
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
                    _scaffoldKey.currentState?.openDrawer();
                  } else {
                    _scaffoldKey.currentState?.openDrawer();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      body: MiScaffold(
        body: ListView(
          children: <Widget>[
            buildSection('Fit your body', 328, 104),
            buildSection('Category of Yoga', 394.14, 105),
            buildSection('Popular Process', 418, 155),
            buildSection('Video courses', 415, 172),
            buildSection('Our Latest blogs', 331, 241),
          ],
        ),
      ),
      drawer: const SideBarMenu(),
    );
  }
}

Widget buildSection(String title, double width, double height) {
  return Container(
    width: width,
    height: height,
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
                child: Text(
                  'Ver más',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: width,
                color: Colors.white,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Item $index'),
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
