import 'package:authentication/di/dependency.dart';
import 'package:common/utils/di/common_dependencies.dart';
import 'package:core/di/dependency.dart';
import 'package:dependencies/di/dependency.dart';
import 'package:product/di/dependency.dart';
import 'package:chart/di/dependency.dart';
import 'package:profile/di/dependency.dart';

class Injections {
  Future<void> initialize() async {
    await _registerSharedDependencies();
    _registerDomains();
  }

  void _registerDomains() {
    AuthenticationDependency();
    ProductDependency();
    ProfileDependency();
    ChartDependency();
  }

  Future<void> _registerSharedDependencies() async {
    await const SharedLibDependencies().registerCore();
    RegisterCoreModule();
    CommonDependencies();
  }
}
