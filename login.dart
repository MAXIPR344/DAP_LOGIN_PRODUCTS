import 'package:flutter/material.dart';
import 'package:flutter_application_1/Router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_1/usuario.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String name = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final List<Usuario> usuarios = [
    Usuario(
      username: 'bob',
      password: 'MECA',
      nombre: 'Bob',
      apellido: 'Esponja',
    ),

  ];

  void login() {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("llena usuario y contraseña"),
        ),
      );

      return;
    }

    Usuario? usuarioEncontrado;

    for (var usuario in usuarios) {
      if (usuario.username == usernameController.text &&
          usuario.password == passwordController.text) {
        usuarioEncontrado = usuario;
        break;
      }
    }

    if (usuarioEncontrado != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            const SnackBar(content: Text("login correcto")),
          )
          .closed
          .then((_) {
            context.go('/app', extra: usuarioEncontrado);
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("login incorrecto"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: usernameController,
                  ),

                  TextField(
                    controller: passwordController,
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ),

          ElevatedButton(
            onPressed: login,
            child: const Text("inicia sesion"),
          ),
        ],
      ),
    );
  }
}
