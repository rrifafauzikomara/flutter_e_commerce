import 'package:flutter/material.dart';
import 'package:resources/colors.gen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorName.textFieldBackgroundGrey,
      body: Center(
        child: Text("Akun Saya"),
      ),
    );
  }
}
