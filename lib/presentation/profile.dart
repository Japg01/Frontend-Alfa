import 'package:flutter/material.dart';
import 'package:alfa_soyzen/presentation/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fl_chart/fl_chart.dart';

class PerfilUsuario extends StatelessWidget {
  final BackendService backendService;

  const PerfilUsuario({Key? key, required this.backendService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadUserData(),
      builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return MiScaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  buildAppBar(context, snapshot.data!),
                  const SizedBox(height: 20.0), // Agrega espacio aquí
                  buildStatisticsSection(),
                  buildSection("Mi entrenamiento", 130.0, 120.0, 8,
                      onViewMorePressed: () {
                    print('Ver más presionado');
                  }, backendService),
                  buildSection("Mis fotos", 130.0, 120.0, 8,
                      onViewMorePressed: () {
                    print('Ver más presionado');
                  }, backendService),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Future<UserData> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? 'Nombre de Usuario';
    return UserData(name: name);
  }

  Widget buildAppBar(BuildContext context, UserData userData) {
    return Container(
      height: 250.0,
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
            const SizedBox(height: 20.0), // Agrega espacio aquí
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                const CircleAvatar(
                  radius: 35.0,
                ),
                const SizedBox(width: 10.0),
                Text(
                  userData.name,
                  style: const TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 10.0,
              child: const LinearProgressIndicator(
                  value: 0.5, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatisticsSection() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 79.0,
            width: 210.0,
            child: BarChart(
              BarChartData(
                barGroups: getBarGroups(),
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) => const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Lun';
                        case 1:
                          return 'Mar';
                        case 2:
                          return 'Mie';
                        case 3:
                          return 'Jue';
                        case 4:
                          return 'Vie';
                        case 5:
                          return 'Sab';
                        case 6:
                          return 'Dom';
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(showTitles: false),
                ),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(enabled: false),
              ),
            ),
          ),
          const SizedBox(width: 20.0), // Agrega espacio aquí
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'Tiempo:\n1:03:30',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> getBarGroups() {
    List<int> weeklyData = [5, 25, 100, 75, 56, 45, 85];

    return List.generate(weeklyData.length, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            y: weeklyData[i].toDouble(),
            colors: [i % 2 == 0 ? Colors.purple : Colors.green],
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
        ],
      );
    });
  }

  // ...
}

class UserData {
  final String name;

  UserData({required this.name});
}

class WeekdayData {
  final String day;
  final int sales;

  WeekdayData(this.day, this.sales);
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
