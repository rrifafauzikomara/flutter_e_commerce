import '../get_it/get_it.dart';
import '../shared_preferences/shared_preferences.dart';

class SharedLibDependencies {
  const SharedLibDependencies();
  Future<void> registerCore()  async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }
}
