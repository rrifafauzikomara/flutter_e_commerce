import 'package:authentication/di/dependency.dart';
import 'package:common/utils/di/common_dependencies.dart';
import 'package:dependencies/di/dependency.dart';

class Injections {
  Future<void> initialize() async {
    await _registerSharedDependencies();
    _registerDomains();
  }

  void _registerDomains() {
    AuthenticationDependency();
  }

  Future<void> _registerSharedDependencies() async {
    await SharedLibDependencies().registerCore();
    CommonDependencies();
  }
}
