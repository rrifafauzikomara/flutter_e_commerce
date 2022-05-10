import '../get_it/get_it.dart';
import '../shared_preferences/shared_preferences.dart';

class SharedLibDependencies {
  SharedLibDependencies() {
    _registerCore();
  }

  void _registerCore() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }
}
