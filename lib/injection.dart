// ignore_for_file: constant_identifier_names

import '../contact_data.dart';
import '../contact_data_impl.dart';
import '../contact_data_mock.dart';

enum Flavor {
  // 生产环境
  PRO,
  // 测试环境
  MOCK,
}

/// 简单的依赖注入
class Injector {
  static final Injector _injector = Injector._internal();
  static Flavor? _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _injector;
  }

  // 内部初始化
  Injector._internal();

  ContactRepository? get contactRepository {
    switch (_flavor) {
      case Flavor.PRO:
        return RandomUserRepository();
      case Flavor.MOCK:
        return ContactMockRepository();
      default:
        return null;
    }
  }
}
