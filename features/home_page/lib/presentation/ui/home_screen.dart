import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorName.white,
      body: Center(
        child: Text("Home screen"),
      ),
    );
  }
}
