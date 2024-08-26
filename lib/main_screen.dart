import 'package:exploregalapagos/shared/bottom_nav_bar.dart';
import 'package:exploregalapagos/shared/bottom_route.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  int usuario = 1;
  CustomBottomNavigationBar? navBar;
  @override
  void initState() {
    super.initState();
    navBar = CustomBottomNavigationBar(
      currentIndex: (index) {
        setState(() {
          this.index = index;
        });
      },
      selected: index,
    ) as CustomBottomNavigationBar?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navBar,
      body: BottomRoute(index: index, usuario: usuario),
    );
  }
}
