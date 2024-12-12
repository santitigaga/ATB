import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  // Validación de correo electrónico
  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }

  Future<void> login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text;

    // Validaciones básicas
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Por favor, ingresa correo y contraseña.';
      });
      return;
    }

    if (!isValidEmail(email)) {
      setState(() {
        errorMessage = 'Correo electrónico no válido.';
      });
      return;
    }

    // Petición al servidor
    try {
      final response = await http.post(
        Uri.parse('http://<TU_BACKEND_URL>/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];

        // Guardar el token JWT
        // Usa paquetes como flutter_secure_storage para almacenar el token de forma segura
        print('Token JWT: $token');

        setState(() {
          errorMessage = null;
        });

        // Navegar a la siguiente pantalla
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        final errorData = jsonDecode(response.body);
        setState(() {
          errorMessage =
              errorData['message'] ?? 'Error en el inicio de sesión.';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error al conectar con el servidor: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: login,
                child: const Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const LoginScreen(),
    routes: {
      '/home': (context) => Scaffold(
            appBar: AppBar(title: const Text('Home')),
            body: const Center(child: Text('Bienvenido a la Home Page')),
          ),
    },
  ));
}
