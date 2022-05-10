import 'package:common/utils/navigation/navigation_helper.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';

class CommonDependencies {
  CommonDependencies() {
    navigation();
  }

  void _registerCore() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }

  void navigation() => sl.registerLazySingleton<NavigationHelper>(
        () => NavigationHelperImpl(),
      );
}
