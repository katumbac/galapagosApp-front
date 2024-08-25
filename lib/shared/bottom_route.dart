import 'package:exploregalapagos/Comentarios/comentarios.dart';
import 'package:exploregalapagos/home.dart';
import 'package:exploregalapagos/sign_in_up.dart';
import 'package:flutter/material.dart';

class BottomRoute extends StatelessWidget {
  final int index;
  final int usuario;
  const BottomRoute({super.key, required this.index, required this.usuario});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      ComentariosScreen(usuario: usuario),
      const SignInUp(),
    ];
    return screens[index];
  }
}
