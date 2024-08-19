import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ComentariosScreen extends StatefulWidget {
  const ComentariosScreen({super.key});

  @override
  _ComentariosScreenState createState() => _ComentariosScreenState();
}

class _ComentariosScreenState extends State<ComentariosScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "EXPLOREGALÁPAGOS."),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Comentarios',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colorbuttonGreen,
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
