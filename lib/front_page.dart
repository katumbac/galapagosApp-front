import 'package:exploregalapagos/main_screen.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/sign_in_up.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key, required this.title});

  final String title;

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/R.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  exploreGreen,
                  exploreGreen1,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "lib/assets/logo_gala.png",
                  width: size.width * 0.4,
                ),
                const SizedBox(height: 0.1),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: textWhite,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorbuttonGreen,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInUp()));
                  },
                  child: Text(
                    'INICIA LA AVENTURA',
                    style: TextStyle(
                        fontSize: size.width * 0.03, color: textWhite),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  '¡Bienvenido/a!',
                  style: TextStyle(
                    fontSize: size.width * 0.03,
                    color: textWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
