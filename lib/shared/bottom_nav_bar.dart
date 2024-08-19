import 'package:exploregalapagos/sign_in_up.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function currentIndex;
  int selected = 0;

  CustomBottomNavigationBar(
      {super.key, required this.selected, required this.currentIndex});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  Color coloractivate = colorbuttonGreen;
  Color colordesactivate = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selected,
      onTap: (index) {
        setState(() {
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SignInUp()),
            );
          } else {
            widget.selected = index;
            widget.currentIndex(index);
          }
          
        });
      },
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
      selectedItemColor: const Color.fromARGB(255, 10, 5, 59),
      unselectedItemColor: Colors.grey,
      iconSize: 33,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: colordesactivate),
          activeIcon: Icon(Icons.home, color: coloractivate),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined, color: colordesactivate),
          activeIcon: Icon(Icons.message_outlined, color: coloractivate),
          label: 'Comentarios',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout, color: colordesactivate),
          activeIcon: Icon(Icons.logout, color: coloractivate),
          label: 'Cerrar Sesión',
        ),
      ],
    );
  }
}
