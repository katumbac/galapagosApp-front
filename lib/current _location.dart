import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({super.key});

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "EXPLOREGALÁPAGOS."),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ubicación Actual',
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
