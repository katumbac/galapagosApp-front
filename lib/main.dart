import 'package:exploregalapagos/front_page.dart';
import 'package:exploregalapagos/sign_in_up.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/Screens/Negocios/negocios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Galápagos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FrontPage(title: 'Explore Galápagos'), 
    );
  }
}
