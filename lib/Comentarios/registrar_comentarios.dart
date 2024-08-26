import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class RegistrarComentario extends StatefulWidget {
  final int usuario;
  const RegistrarComentario({super.key, required this.usuario});

  @override
  State<RegistrarComentario> createState() =>_RegistrarComentarioState();
}

class _RegistrarComentarioState extends State<RegistrarComentario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Registrar Comentario",
        back: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                maxLength: 200,
                maxLines: 17,
                decoration: InputDecoration(
                  hintText: 'Escriba su comentario',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorbuttonGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("REGISTRAR",
                  style: TextStyle(
                    fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}
