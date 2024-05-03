import 'package:flutter/material.dart';
import 'package:alfa_soyzen/widgets/navegation.dart';
import 'package:alfa_soyzen/widgets/sidebarmenu.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MiScaffold(
          body: Scaffold(
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
                        if (_scaffoldKey.currentState?.isEndDrawerOpen ??
                            false) {
                          _scaffoldKey.currentState?.openEndDrawer();
                        } else {
                          _scaffoldKey.currentState?.openEndDrawer();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: ListView(
              children: <Widget>[
                buildSection('Fit your body', 328, 104),
                buildSection('Category of Yoga', 394.14, 105),
                buildSection('Popular Process', 418, 155),
                buildSection('Video courses', 415, 172),
                buildSection('Our Latest blogs', 331, 241),
              ],
            ),
            endDrawer: const SideBarMenu(),
          ),
        ),
      ],
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
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(title, style: const TextStyle(fontSize: 20)),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: width,
                color: Colors.white,
                child: Center(child: Text(title)),
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
