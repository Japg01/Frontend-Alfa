import 'package:flutter/material.dart';
import 'package:alfa_soyzen/presentation/login/forgotpass.dart';
import 'package:alfa_soyzen/presentation/login/register.dart';


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
     // Devuelve un contenedor con una imagen de fondo y un Scaffold transparente
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage("assets/images/fondo.png"), 
          fit: BoxFit.cover, // fitcover ajusta la imagen para que cubra al contenedor
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
                scale: 0.5, // Escala deseada para reducir el tamaño de la imagen
                child: Image.asset(
                  "assets/images/logoblanco.png", // Ruta de la imagen
                  fit: BoxFit.cover, // Ajustar la imagen al contenedor
                ),
              ),
            ),
            Positioned(bottom: 0, child: _buildBottom()), //posicionamiento de contenedor 
          ],
        ),
      ),
    );
  }
// Tarjeta donde va el formulario 
  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width, //ancho de pantalla
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

// Construccion de los campos de texto de formulario
  Widget _buildForm() {
    return SizedBox(height: 560,
      child: Column( //organiza a los widgets hijos/ secundarios de forma vertical 
        crossAxisAlignment: CrossAxisAlignment.center, // Alinea a los widgets hijos de forma central dentro de la columna
        children: [
          SizedBox(height: 20),
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
          // _buildRememberForgot(),
          const SizedBox(height: 20),
          _buildLoginButton(),
          const SizedBox(height: 20), // Espacio adicional entre el botón de inicio de sesión y el botón de "Forgot your password?"
          TextButton(
        onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ForgotPasswordPage()), 
      );
        },
        child: Text ("Forgot password?"),
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return RegisterPage();
          }),
        );

        debugPrint("Email: ${emailController.text}");
        debugPrint("Password: ${passwordController.text}");
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
}