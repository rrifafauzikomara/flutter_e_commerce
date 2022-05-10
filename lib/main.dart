import 'package:flutter/material.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_) => MaterialApp(
        title: 'Flutter E Commerce',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
