import 'package:alfa_soyzen/presentation/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
// import 'package:login/forgotpass.dart'; // Asegúrate de importar ForgotPasswordPage si no está definido
// Importa la página de inicio de sesión si aún no lo has hecho

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage("assets/images/fondo.png"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.color),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: -65,
              left: 0,
              right: 0,
              child: Transform.scale(
                scale: 0.5,
                child: Image.asset(
                  "assets/images/logoblanco.png",
                  fit: BoxFit.cover,
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
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
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
    return SizedBox(
      height: 560,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          _buildGreyText("Hi! Enter your credentials"),
          const SizedBox(height: 60),
          _buildGreyText("Email"),
          _buildInputField(emailController),
          const SizedBox(height: 40),
          _buildGreyText("Password"),
          _buildInputField(passwordController, isPassword: true),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          _buildLoginButton(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
              //             );
            },
            child: const Text("Forgot password?"),
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? const Icon(Icons.remove_red_eye)
            : const Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          if (EmailValidator.validate(emailController.text)) {
            _loginUser(); // Llama a la función para iniciar sesión
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("¡Attention!"),
                  content: const Text("You must put a email"),
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
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("¡Attention!"),
                content: const Text("Please complete all the flieds"),
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
        backgroundColor: Colors.deepPurple,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "Login",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> _loginUser() async {
    final url =
        Uri.parse('https://backend-alfa-production.up.railway.app/auth/login');
    final response = await http.post(
      url,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> userData = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('nombreUsuario', userData['name']);
      await prefs.setString('idUsuario', userData['uuid']);
    }

    if (response.statusCode == 201) {
      // Si el inicio de sesión es exitoso, puedes navegar a otra página o mostrar un mensaje de éxito
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomeScreen()), // Reemplaza NextPage() con la página a la que deseas navegar después del inicio de sesión exitoso
      );
    } else {
      // Si falla el inicio de sesión, puedes mostrar un mensaje de error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text("Login failed. Error: ${response.body}"),
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
  }
}
