import 'package:account/presentation/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:account/presentation/bloc/logout_bloc/logout_cubit.dart';
import 'package:account/presentation/bloc/update_photo_bloc/update_photo_bloc.dart';
import 'package:account/presentation/bloc/user_bloc/user_cubit.dart';
import 'package:account/presentation/ui/edit_profile_screen.dart';
import 'package:auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:auth/presentation/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:auth/presentation/ui/sign_in_screen.dart';
import 'package:auth/presentation/ui/sign_up_screen.dart';
import 'package:cart_feature/presentation/bloc/bloc.dart';
import 'package:common/utils/navigation/argument/arguments.dart';
import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/firebase/firebase.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:detail_product/presentation/bloc/product_detail_bloc/bloc.dart';
import 'package:detail_product/presentation/ui/product/detail_product_screen.dart';
import 'package:cart_feature/presentation/ui/cart_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:home_page/presentation/bloc/banner_bloc/banner_cubit.dart';
import 'package:home_page/presentation/bloc/home_bloc/home_cubit.dart';
import 'package:home_page/presentation/bloc/product_bloc/product_cubit.dart';
import 'package:home_page/presentation/bloc/product_category_bloc/product_category_cubit.dart';
import 'package:home_page/presentation/ui/bottom_navigation.dart';
import 'package:onboarding/presentation/bloc/onboarding_bloc/onboarding_cubit.dart';
import 'package:onboarding/presentation/bloc/splash_bloc/splash_cubit.dart';
import 'package:onboarding/presentation/ui/on_boarding_screen.dart';
import 'package:onboarding/presentation/ui/splash_screen.dart';
import 'package:common/utils/navigation/router/app_routes.dart';
import 'injections/injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Injections().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) => MaterialApp(
        title: 'Flutter E Commerce',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider(
            create: (_) => SplashCubit(
              getOnBoardingStatusUseCase: sl(),
              getTokenUseCase: sl(),
            )..initSplash(),
          )
        ], child: SplashScreen()),
        navigatorKey: NavigationHelperImpl.navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case AppRoutes.splash:
              return MaterialPageRoute(builder: (_) => SplashScreen());
            case AppRoutes.onboarding:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => OnBoardingCubit(
                    cacheOnBoardingUseCase: sl(),
                  ),
                  child: OnBoardingScreen(),
                ),
              );
            case AppRoutes.signIn:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => SignInBloc(
                    cacheTokenUseCase: sl(),
                    signInUseCase: sl(),
                  ),
                  child: SignInScreen(),
                ),
              );
            case AppRoutes.signUp:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => SignUpBloc(
                    cacheTokenUseCase: sl(),
                    signUpUseCase: sl(),
                  ),
                  child: SignUpScreen(),
                ),
              );
            case AppRoutes.home:
              return MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<HomeCubit>(
                      create: (_) => HomeCubit(),
                    ),
                    BlocProvider<BannerCubit>(
                      create: (_) => BannerCubit(
                        getBannerUseCase: sl(),
                      )..getBanner(),
                    ),
                    BlocProvider<ProductCubit>(
                      create: (_) => ProductCubit(
                        getProductUseCase: sl(),
                      )..getProduct(),
                    ),
                    BlocProvider<ProductCategoryCubit>(
                      create: (_) => ProductCategoryCubit(
                        getProductCategoryCase: sl(),
                      )..getProductCategory(),
                    ),
                    BlocProvider<UserCubit>(
                      create: (_) => UserCubit(
                        getUserUseCase: sl(),
                      )..getUser(),
                    ),
                    BlocProvider<LogoutCubit>(
                      create: (_) => LogoutCubit(
                        logoutUseCase: sl(),
                      ),
                    ),
                  ],
                  child: const BottomNavigation(),
                ),
              );
            case AppRoutes.editProfile:
              return MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<UserCubit>(
                      create: (_) => UserCubit(
                        getUserUseCase: sl(),
                      )..getUser(),
                    ),
                    BlocProvider<EditProfileBloc>(
                      create: (_) => EditProfileBloc(
                        firebaseMessaging: sl(),
                        updateUserUseCase: sl(),
                      ),
                    ),
                    BlocProvider<UpdatePhotoCubit>(
                      create: (_) => UpdatePhotoCubit(
                        imagePicker: sl(),
                        uploadPhotoUsecase: sl(),
                      ),
                    ),
                  ],
                  child: EditProfileScreen(),
                ),
              );
            case AppRoutes.detailProduct:
              final argument = settings.arguments as DetailProductArgument;
              return MaterialPageRoute(
                builder: (_) => BlocProvider<ProductDetailCubit>(
                  create: (_) => ProductDetailCubit(
                    getProductUseCase: sl(),
                    getSellerUseCase: sl(),
                    addToChartUseCase: sl(),
                  ),
                  child: DetailProductScreen(
                    argument: argument,
                  ),
                ),
              );
            case AppRoutes.cartList:
              return MaterialPageRoute(
                builder: (_) => BlocProvider<CartCubit>(
                  create: (_) => CartCubit(
                    getChartUseCase: sl(),
                    addToChartUseCase: sl(),
                    deleteChartUseCase: sl(),
                  ),
                  child: const CartListScreen(),
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
