import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:home_page/presentation/bloc/home_bloc/home_cubit.dart';
import 'package:home_page/presentation/bloc/home_bloc/home_state.dart';
import 'package:account/presentation/ui/account_screen.dart';
import 'package:home_page/presentation/ui/home_screen.dart';
import 'package:resources/assets.gen.dart';
import 'package:resources/colors.gen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: IndexedStack(
              index: context.read<HomeCubit>().state.homeState.data,
              children: [
                const HomeScreen(),
                Container(
                  color: Colors.blue,
                ),
                AccountScreen(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: (value) {
                context.read<HomeCubit>().changeTab(tabIndex: value);
              },
              currentIndex: context.read<HomeCubit>().state.homeState.data ?? 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorName.orange,
              unselectedItemColor: ColorName.iconGrey,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                color: ColorName.orange,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                color: ColorName.iconGrey,
              ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Assets.images.icon.home.svg(
                    color: context.read<HomeCubit>().state.homeState.data == 0
                        ? ColorName.orange
                        : ColorName.iconGrey,
                  ),
                  label: "Beranda",
                ),
                BottomNavigationBarItem(
                  icon: Assets.images.icon.history.svg(
                    color: context.read<HomeCubit>().state.homeState.data == 1
                        ? ColorName.orange
                        : ColorName.iconGrey,
                  ),
                  label: "Riwayat",
                ),
                BottomNavigationBarItem(
                  icon: Assets.images.icon.account.svg(
                    color: context.read<HomeCubit>().state.homeState.data == 2
                        ? ColorName.orange
                        : ColorName.iconGrey,
                  ),
                  label: "Akun",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
