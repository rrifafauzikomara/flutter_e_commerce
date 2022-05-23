import 'package:auth/presentation/ui/sign_in_screen.dart';
import 'package:auth/presentation/ui/sign_up_screen.dart';
import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:home_page/presentation/bloc/home_cubit.dart';
import 'package:home_page/presentation/ui/bottom_navigation.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_cubit.dart';
import 'package:onboarding/presentation/ui/on_boarding_screen.dart';
import 'package:onboarding/presentation/ui/splash_screen.dart';
import 'package:common/utils/navigation/router/app_routes.dart';
import 'injections/injections.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Injections().initialize();
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
        home: MultiBlocProvider(providers: [
          BlocProvider(
            create: (_) => SplashCubit(
              getOnBoardingStatusUseCase: sl(),
            )..initSplash(),
          )
        ], child: SplashScreen()),
        navigatorKey: NavigationHelperImpl.navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case AppRoutes.splash:
              return MaterialPageRoute(builder: (_) => SplashScreen());
            case AppRoutes.onboarding:
              return MaterialPageRoute(builder: (_) => OnBoardingScreen());
            case AppRoutes.signIn:
              return MaterialPageRoute(builder: (_) => SignInScreen());
            case AppRoutes.signUp:
              return MaterialPageRoute(builder: (_) => SignUpScreen());
            case AppRoutes.home:
              return MaterialPageRoute(
                builder: (_) => BlocProvider<HomeCubit>(
                  create: (_) => HomeCubit(),
                  child: const BottomNavigation(),
                ),
              );
            default:
              return MaterialPageRoute(builder: (_) => SplashScreen());
          }
        },
      ),
    );
  }
}
