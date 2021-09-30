import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yuk_ngafal/auth/auth.dart';
import 'package:yuk_ngafal/bindings/login_bindings.dart';
import 'package:yuk_ngafal/common/custom_swatch.dart';
import 'package:yuk_ngafal/data/api/calendar_client.dart';
import 'package:yuk_ngafal/ui/home_page.dart';
import 'package:yuk_ngafal/ui/login_page/login_page.dart';
import 'package:yuk_ngafal/ui/splash_screen/splash_screen.dart';
import 'package:yuk_ngafal/utils/secrets.dart';
import 'package:googleapis/calendar/v3.dart' as cal;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // var _clientID = ClientId(Secret.getId(), "");
  // const _scopes = [cal.CalendarApi.calendarScope];
  // await clientViaUserConsent(_clientID, _scopes, prompt)
  //     .then((AuthClient client) async {
  //   CalendarClient.calendar = cal.CalendarApi(client);
  // });
  runApp(const MyApp());
}

void prompt(String uri) async {
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        title: 'YukNgafal!',
        home: const SplashScreen(),
        theme: ThemeData(primarySwatch: CustomSwatch.celticBlueSwatch),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => const SplashScreen(),
          ),
          GetPage(
            name: '/home',
            page: () => HomePage(),
          ),
          GetPage(
              name: '/login',
              page: () => const LoginPage(),
              binding: LoginBindings()),
        ],
      );
    });
  }
}
