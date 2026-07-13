import 'package:flutter_application_1/screens/product.dart';
import 'package:flutter_application_1/screens/app.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/results.dart';
import 'package:flutter_application_1/usuario.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: '/app',
      builder: (context, state) {
        final usuario = state.extra as Usuario;

        return AppScreen(
          usuario: usuario,
        );
      },
    ),

    GoRoute(
      path: '/detalle',
      builder: (context, state) {
        final producto = state.extra as Product;

        return ResultsScreen(
          producto: producto,
        );
      },
    ),
  ],
);
