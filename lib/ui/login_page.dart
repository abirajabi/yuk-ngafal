import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yuk_ngafal/common/style.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: himakom,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Welcome to YukNgafal',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp),
              ),
              SizedBox(height: 2.h),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean iaculis pellentesque elementum.',
                style:
                    GoogleFonts.openSans(color: Colors.white, fontSize: 12.sp),
              ),
              SizedBox(height: 2.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email address',
                  hintStyle: GoogleFonts.openSans(
                      color: Colors.white, fontSize: 12.sp),
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFff5978), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: GoogleFonts.openSans(
                      color: Colors.white, fontSize: 12.sp),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFFff5978), width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Text('Login',
                      style: GoogleFonts.openSans(
                          color: himakom,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shadowColor: himakom,
                    primary: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      children: [TextFormField()],
    );
  }
}
