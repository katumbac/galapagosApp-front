import 'package:exploregalapagos/comentarios.dart';
import 'package:exploregalapagos/home.dart';
import 'package:exploregalapagos/sign_in_up.dart';
import 'package:flutter/material.dart';

class BottomRoute extends StatelessWidget {
  final int index;
  const BottomRoute({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const ComentariosScreen(),
      const SignInUp(),
    ];
    return screens[index];
  }
}
