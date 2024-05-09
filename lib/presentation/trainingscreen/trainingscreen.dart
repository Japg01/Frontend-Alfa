// import 'package:flutter/material.dart';

// class TrainingScreen extends StatefulWidget {
//   const TrainingScreen({super.key});

//   @override
//   _TrainingScreen createState() => _TrainingScreen();
// }

// class _TrainingScreen extends State<TrainingScreen> {
//   String? categoriaSeleccionada;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: _body(context),
//       ),
//     );
//   }

//   Widget _body(BuildContext context) {
//     return SingleChildScrollView(
//       children: [
//         Stack(
//           children: <Widget>[
//             Container(
//               decoration: const BoxDecoration(
//                 color: Colors.purple,
//                 image: DecorationImage(
//                   image: AssetImage('assets/logo/Fondo Morado.png'),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(50.0),
//                 ),
//               ),
//               height: 110.0,
//             ),
//             Positioned(
//               top: 10.0,
//               left: 0.0,
//               right: 0.0,
//               child: AppBar(
//                 titleSpacing: 0.0,
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//                 title: Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back),
//                       color: Colors.white,
//                       onPressed: () {},
//                     ),
//                     const Text(
//                       'Videos',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 70.0,
//               left: 0.0,
//               right: 0.0,
//               child: Column(
//                 children: [
//                   Categorias(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]
//     );
//   }

//   Widget programsMaster(
//       String title, String instructor, String difficulty, String imagePath) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
//       padding: const EdgeInsets.all(5.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 5.0),
//                 Text(
//                   instructor,
//                   style: const TextStyle(
//                     fontSize: 10.0,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 5.0),
//                 Text(
//                   difficulty,
//                   style: const TextStyle(
//                     fontSize: 10.0,
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10.0),
//           Container(
//             width: 80.0,
//             height: 80.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               image: DecorationImage(
//                 image: AssetImage(imagePath),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }