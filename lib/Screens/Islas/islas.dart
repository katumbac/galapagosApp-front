import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/widgets/card_info_isla.dart';

class IslasScreen extends StatefulWidget {
  const IslasScreen({super.key});

  @override
  State<IslasScreen> createState() => _IslasScreenState();
}

class _IslasScreenState extends State<IslasScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
          title: "Las Islas Principales",
          back: true,
        ),
        body: Center(child: CardInfoIsla()));
  }
}
