import 'package:get/get.dart';
import 'package:yuk_ngafal/controller/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}
