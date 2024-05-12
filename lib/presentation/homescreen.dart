import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alfa_soyzen/widgets/navegation.dart';
import 'package:alfa_soyzen/widgets/sidebarmenu.dart';
import 'package:alfa_soyzen/widgets/progressbar.dart';
import 'package:alfa_soyzen/presentation/profile.dart' as profile;

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final BackendService backendService = BackendService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: MiScaffold(
        body: ListView(
          children: <Widget>[
            const ProgressSection(),
            buildSection('Categoria de Yoga', 70, 70, 8, onViewMorePressed: () {
              print('Ver más presionado');
            }, backendService),
            buildSection(
              'Procesos Populares',
              130,
              120,
              8,
              onViewMorePressed: () {
                print('Ver más presionado');
              },
              backendService,
            ),
            buildSection(
              'Videos de Cursos',
              140,
              200,
              8,
              onViewMorePressed: () {
                Navigator.pushNamed(context, '/courses');
              },
              backendService,
            ),
            buildSection(
              'Nuestros últimos Blogs',
              155,
              120,
              8,
              onViewMorePressed: () {
                print('Ver más presionado');
              },
              backendService,
            ),
            buildSection(
              'Consejos y temas',
              155,
              120,
              8,
              onViewMorePressed: () {
                Navigator.pushNamed(context, '/tipsTopics');
              },
              backendService,
            ),
          ],
        ),
      ),
      drawer: const SideBarMenu(),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(210);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String name = 'Nombre de Usuario';
  String uuid = 'ID de Usuario';
  int? _selectedDayIndex = 1; // Por defecto, 'Hoy' está seleccionado
  final List<String> _days = ['Mañana', 'Hoy', 'Ayer'];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'Nombre de Usuario';
      uuid = prefs.getString('uuid') ?? 'ID de Usuario';
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/icons/user.png'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      profile.PerfilUsuario(backendService: BackendService()),
                ),
              );
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4F14A0), Color(0xFF8066FF)],
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0), // Redondea la esquina aquí
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0), // Aumenta el padding vertical aquí
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(
                              'ID: ${uuid.substring(0, 8)}', // Muestra solo los primeros 8 caracteres del ID aquí
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    onTap: () {
                      Navigator.pushNamed(context, '/popularSearch');
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Buscar...',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _days.map((day) {
                      int index = _days.indexOf(day);
                      return FilterChip(
                        label: Text(day),
                        selected: _selectedDayIndex == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedDayIndex = selected ? index : null;
                          });
                        },
                        selectedColor: Colors.transparent,
                        checkmarkColor: Colors.black,
                        backgroundColor: Colors.transparent,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackendService {
  // Simula la obtención de ítems del backend
  List<Map<String, String>> getItems() {
    // Aquí puedes agregar la lógica para obtener los ítems del backend
    // Como no hay conexión, devolvemos una lista de ítems de ejemplo
    return [
      {'image': 'assets/image/no-image-found-360x250.png', 'title': 'Ítem 1'},
      {'image': 'assets/image/no-image-found-360x250.png', 'title': 'Ítem 2'},
      {'image': 'assets/image/no-image-found-360x250.png', 'title': 'Ítem 3'},
      {'image': 'assets/image/no-image-found-360x250.png', 'title': 'Ítem 4'},
      {'image': 'assets/image/no-image-found-360x250.png', 'title': 'Ítem 5'},
      {'image': 'assets/image/no-image-found-360x250.png', 'title': 'Ítem 6'},
      {'image': 'assets/image/no-image-found-360x250.png', 'title': 'Ítem 7'},
      {'image': 'assets/image/no-image-found-360x250.png', 'title': 'Ítem 8'},
    ];
  }
}

Widget buildSection(String title, double height, double width, int itemCount,
    BackendService backendService,
    {bool showMoreButton = true, required Null Function() onViewMorePressed}) {
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
                  onViewMorePressed();
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
            String image =
                item['image'] ?? 'assets/image/no-image-found-360x250.png';
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
                              'assets/image/no-image-found-360x250.png'),
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
