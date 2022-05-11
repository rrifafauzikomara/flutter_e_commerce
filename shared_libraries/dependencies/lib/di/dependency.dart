import '../get_it/get_it.dart';
import '../shared_preferences/shared_preferences.dart';

class SharedLibDependencies {
  SharedLibDependencies() {
    _registerCore();
  }

  void _registerCore() => sl.registerLazySingletonAsync(
        () => SharedPreferences.getInstance(),
      );
}
