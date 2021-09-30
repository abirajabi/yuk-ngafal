import 'package:get/get.dart';
import 'package:yuk_ngafal/auth/auth.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthService(), fenix: true);
  }
}
