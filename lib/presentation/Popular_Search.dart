import 'package:alfa_soyzen/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class PopularSearch extends StatefulWidget {
  const PopularSearch({super.key});

  @override
  _PopularSearch createState() => _PopularSearch();
}

class _PopularSearch extends State<PopularSearch> {
  String? categoriaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Colors.purple,
              image: DecorationImage(
                image: AssetImage('assets/logo/Fondo Morado.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50.0),
              ),
            ),
            height: 100.0,
          ),
          Card(
            elevation: 20.0,
            margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 70.0),
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              children: [
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 0.0,
                          left: 0,
                          right: 0,
                        ),
                        child: BarraBusqueda(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 20.0,
            margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 140.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                categoriasBotones(),
                const SizedBox(height: 30),
                const Text(
                  'Popular Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      PopularCourses(
                        '15 Minutes yoga practice the beginner in 30 days',
                        'Trainning',
                        'Feb 17, 2020',
                        'assets/icons/Yoga Ejemplo.png',
                      ),
                      PopularCourses(
                        '23 Minutes yoga practice in the Trainning in 30 days',
                        'Courses',
                        'Feb 18, 2020',
                        'assets/icons/Yoga Ejemplo.png',
                      ),
                      PopularCourses(
                        '30 Minutes yoga practice for experts in 30 days',
                        'Yoga',
                        'Feb 19, 2020',
                        'assets/icons/Yoga Ejemplo.png',
                      ),
                      // Agrega más cursos según sea necesario
                    ],
                  ),
                ),
                const Text(
                  'Programs Master',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                programsMaster(
                  '30 day yoga challenge',
                  'Ralph Edwards',
                  'Level 5',
                  'assets/icons/Yoga Ejemplo.png',
                ),
                programsMaster(
                  '30 day yoga challenge',
                  'Ralph Edwards',
                  'Level 5',
                  'assets/icons/Yoga Ejemplo.png',
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              titleSpacing: 0.0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  const Text(
                    'Popular Search',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categoriasBotones() {
    List<String> categorias = [
      'Prenatal',
      'For Women',
      'Trainning',
      'Courses',
      'Videos',
      'Morning',
      'Yoga',
      'Restorative',
      'Recent Post',
      'Most Popular',
    ];

    // Al inicio, 'For Women' está seleccionado
    categoriaSeleccionada = 'For Women';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10.0,
          runSpacing: 5.0,
          children: categorias.map((categoria) {
            return ElevatedButton(
              onPressed: () {
                setState(() {
                  // Actualiza la categoría seleccionada al hacer clic en un botón
                  categoriaSeleccionada =
                      categoriaSeleccionada == categoria ? null : categoria;
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 18.0,
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    // Establece el color de fondo según si está seleccionado o no
                    return categoria == categoriaSeleccionada
                        ? Colors.deepPurple
                        : Colors.deepPurple[100]!;
                  },
                ),
              ),
              child: Text(
                categoria,
                style: TextStyle(
                  fontSize: 14.0,
                  color: categoria == categoriaSeleccionada
                      ? Colors.deepPurple[100]!
                      : Colors.deepPurple,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget PopularCourses(
      String title, String category, String date, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Manejar la acción cuando se hace clic en el curso
      },
      child: Container(
        width: 200.0,
        margin: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 100.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          category,
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget programsMaster(
      String title, String instructor, String difficulty, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  instructor,
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  difficulty,
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
