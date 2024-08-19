import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class IslasScreen extends StatefulWidget {
  const IslasScreen({super.key});

  @override
  State<IslasScreen> createState() => _IslasScreenState();
}

class _IslasScreenState extends State<IslasScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Las Islas Principales",
            back: true,
          ),
        ));
  }
}
