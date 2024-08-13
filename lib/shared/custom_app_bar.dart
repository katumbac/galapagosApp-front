import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  final bool? back;

  const CustomAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.back,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: back ?? false,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, color: textWhite),
      ),
      bottom: bottom,
      iconTheme: const IconThemeData(
        color: defaultIconColor, // Set the color of the back button here
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            "lib/assets/logo_gala1.png",
            height: 50,
          ),
        ),
      ],
      backgroundColor: colorbuttonGreen,
    );
  }

  @override
  Size get preferredSize => bottom == null
      ? const Size.fromHeight(kToolbarHeight)
      : Size.fromHeight(kToolbarHeight + bottom!.preferredSize.height);
}
