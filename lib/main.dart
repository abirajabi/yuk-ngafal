import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yuk_ngafal/bindings/login_bindings.dart';
import 'package:yuk_ngafal/common/palette.dart';
import 'package:yuk_ngafal/ui/home_page.dart';
import 'package:yuk_ngafal/ui/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        title: 'YukNgafal!',
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => const HomePage()),
          GetPage(
              name: '/login',
              page: () => const LoginPage(),
              binding: LoginBindings()),
        ],
      );
    });
  }
}
