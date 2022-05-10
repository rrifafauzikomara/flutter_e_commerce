import 'package:common/utils/di/common_dependencies.dart';
import 'package:dependencies/di/dependency.dart';

class Injections {
  void initialize() {
    _registerSharedDependencies();
  }

  void _registerSharedDependencies() {
    SharedLibDependencies();
    CommonDependencies();
  }
}
