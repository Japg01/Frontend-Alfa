import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

// VAR
  String name = ''; //
  String phone = ''; //
  String email = ''; //
  String password = '';
  bool rememberUser = false;
  bool acceptTerms = false;
  RegExp phoneVerifi = RegExp(r'^[0-9]+$');
  RegExp nameVerifi = RegExp(r'^[a-zA-Z0-9]{3,30}$');

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -120,
              left: 0,
              right: 0,
              child: Transform.scale(
                scale: 0.3,
                child: Image.asset(
                  "assets/images/Logo.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(150),
            topRight: Radius.circular(150),
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/fondo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          child: Text(
            "Sign up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _buildGreyText("Please, complete this form"),
        const SizedBox(height: 30),
        _buildGreyText("Full name"),
        _buildInputField(nameController),
        const SizedBox(height: 20),
        _buildGreyText("Email"),
        _buildInputField(emailController),
        const SizedBox(height: 20),
        _buildGreyText("Phone Number"),
        _buildInputField(phoneController),
        const SizedBox(height: 20),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        Row(
          children: [
            Checkbox(
              value: acceptTerms,
              onChanged: (value) {
                setState(() {
                  acceptTerms = value!;
                });
              },
            ),
            _buildGreyText("I accept terms and conditions"),
          ],
        ),
        const SizedBox(height: 20),
        _buildRegisterButton(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        iconColor: Colors.white,
        suffixIcon: isPassword ? const Icon(Icons.remove_red_eye) : null,
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        if (acceptTerms) {
          Navigator.pushNamed(context, '/home');
          // if (nameController
          //         .text.isNotEmpty && //verifica si los campos están llenos
          //     phoneController.text.isNotEmpty &&
          //     emailController.text.isNotEmpty &&
          //     passwordController.text.isNotEmpty) {
          //   if (nameVerifi.hasMatch(nameController.text)) {
          //     if (phoneVerifi.hasMatch(phoneController.text) &&
          //         phoneController.text.length == 11) {
          //       if (EmailValidator.validate(emailController.text)) {
          //         //si todos los datos son validos se registra el usuario mediante el metodo RegisterUser

          //         //funcion para registrar al usuario
          //         //_registerUser();
          //       } else {
          //         showDialog(
          //           context: context,
          //           builder: (BuildContext context) {
          //             return AlertDialog(
          //               title: const Text("¡Attention!"),
          //               content: const Text("You must put a email"),
          //               actions: [
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.of(context).pop();
          //                   },
          //                   child: const Text("OK"),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       }
          //     } else {
          //       showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             title: const Text("¡Attention!"),
          //             content: const Text("Please write a phone number valid"),
          //             actions: [
          //               TextButton(
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //                 child: const Text("OK"),
          //               ),
          //             ],
          //           );
          //         },
          //       );
          //     }
          //   } else {
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) {
          //         return AlertDialog(
          //           title: const Text("¡Attention!"),
          //           content: const Text(
          //               "The name must be between 3 and 30 caracters"),
          //           actions: [
          //             TextButton(
          //               onPressed: () {
          //                 Navigator.of(context).pop();
          //               },
          //               child: const Text("OK"),
          //             ),
          //           ],
          //         );
          //       },
          //     );
          //   }
          // } else {
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return AlertDialog(
          //         title: const Text("¡Attention!"),
          //         content: const Text("Please complete all the flieds"),
          //         actions: [
          //           TextButton(
          //             onPressed: () {
          //               Navigator.of(context).pop();
          //             },
          //             child: const Text("OK"),
          //           ),
          //         ],
          //       );
          //     },
          //   );
          // }
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("¡Attention!"),
                content: const Text("Please accept the terms and conditions"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        backgroundColor: Colors.white,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "Sign up",
        style: TextStyle(color: Colors.deepPurple),
      ),
    );
  }

//   Future<void> _registerUser() async {
//     //url para enviar solicitud de registro
//     final url = Uri.parse(
//         'http://172.21.112.1:3900/auth/register'); //se utiliza para acceder al endpoint de la back
//     final response = await http.post(
//       //realizamos una solicitud http POST con los datos del usuario
//       url,
//       body: {
//         'name': nameController.text,
//         'phone': phoneController.text,
//         'email': emailController.text,
//         'password': passwordController.text,
//       },
//     );

//     if (response.statusCode == 201) {
//       // Si la respuesta es exitosa, mostrar un diálogo con la respuesta del backend
//       showDialog(
//         // ignore: use_build_context_synchronously
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Registro exitoso"),
//             content: Text("Respuesta del servidor: ${response.body}"),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text("OK"),
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       // Si la respuesta no es exitosa, mostrar un diálogo con un mensaje de error
//       showDialog(
//         // ignore: use_build_context_synchronously
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text("Error"),
//             content: Text(
//                 "No se pudo completar el registro. Error: ${response.body}"),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text("OK"),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
}
