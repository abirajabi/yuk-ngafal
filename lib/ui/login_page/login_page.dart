import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_ngafal/auth/auth.dart';
import 'package:yuk_ngafal/common/button_style.dart';
import 'package:yuk_ngafal/common/color_style.dart';
import 'package:yuk_ngafal/common/text_style.dart';
import 'package:sizer/sizer.dart';
import 'package:yuk_ngafal/widgets/google_sign_in_btn.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: celticBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              child: Column(
                children: [
                  Text(
                    'Selamat datang di YukNgafal!',
                    style: whiteHeading30,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean iaculis pellentesque elementum.',
                    style: GoogleFonts.openSans(
                        color: Colors.white, fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login', style: celticHeading16),
                  SizedBox(height: 2.h),
                  TextFormField(
                    style: blackGreyBody12,
                    cursorColor: blackGrey,
                    cursorWidth: 1.6,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: celticBlue.withOpacity(0.7),
                      ),
                      hintText: 'Email address',
                      hintStyle: celticBody12,
                      focusColor: celticBlue,
                      enabledBorder: celticTextFieldBorder,
                      focusedBorder: celticTextFieldBorder,
                      errorBorder: errorTextFieldBorder,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextFormField(
                    style: blackGreyBody12,
                    cursorColor: blackGrey,
                    cursorWidth: 1.6,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: celticBlue.withOpacity(0.7),
                      ),
                      hintText: 'Password',
                      hintStyle: celticBody12,
                      enabledBorder: celticTextFieldBorder,
                      focusedBorder: celticTextFieldBorder,
                      errorBorder: errorTextFieldBorder,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      child: Text('LOGIN', style: whiteButton12),
                      style: ElevatedButton.styleFrom(
                        shadowColor: celticBlue,
                        primary: celticBlue,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: const Text(
                            'or login with',
                            style: TextStyle(color: Colors.grey),
                          )),
                      const Expanded(
                        child: Divider(),
                      )
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FutureBuilder(
                        future: AuthService.initializeFirebase(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error');
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return const GoogleSignInButton();
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                      ElevatedButton(
                        child: Text('F'),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        child: Text('A'),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
