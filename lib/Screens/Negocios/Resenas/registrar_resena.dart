import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/Screens/Negocios/Resenas/resenas.dart';

class RegistrarResena extends StatefulWidget {
  final int idNegocio;
  const RegistrarResena({super.key, required this.idNegocio});

  @override
  State<RegistrarResena> createState() =>_RegistrarResenaState();
}

class _RegistrarResenaState extends State<RegistrarResena> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Registrar Reseña",
        back: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                maxLength: 200,
                maxLines: 17,
                decoration: InputDecoration(
                  hintText: 'Escriba su reseña',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ),
            ),
            SizedBox(height: 50),
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
