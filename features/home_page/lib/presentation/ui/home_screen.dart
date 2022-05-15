import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:home_page/presentation/bloc/home_cubit.dart';
import 'package:home_page/presentation/bloc/home_state.dart';
import 'package:resources/colors.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                Container(
                  color: Colors.black,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.red,
                ),
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
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Beranda",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.article_outlined),
                  label: "Riwayat",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_outlined),
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
