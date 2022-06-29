import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorName.white,
      body: Center(
        child: Text(
          "Data Diri",
        ),
      ),
    );
  }
}
