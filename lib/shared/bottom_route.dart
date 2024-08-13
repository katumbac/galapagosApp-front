import 'package:exploregalapagos/current%20_location.dart';
import 'package:exploregalapagos/home.dart';

import 'package:flutter/material.dart';

class BottomRoute extends StatelessWidget {
  final int index;
  const BottomRoute({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const CurrentLocationScreen(),
    ];
    return screens[index];
  }
}