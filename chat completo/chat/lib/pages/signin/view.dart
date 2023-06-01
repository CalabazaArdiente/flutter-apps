import 'package:chat/common/values/values.dart';
import 'package:chat/common/widgets/widgets.dart';
import 'package:chat/pages/signin/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildLogo() {
      return Container(
        width: 150.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Container(
            width: 100.w,
            height: 100.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: Stack(
              children: [
                Positioned(
                    child: Image.asset(
                  'assets/images/ic_launcher.png',
                  width: 100.w,
                  height: 100.w,
                  fit: BoxFit.cover,
                )),
              ],
            )),
      );
    }

    Widget buildThirdPartyLogIn() {
      return Container(
          width: 300.w,
          margin: EdgeInsets.only(bottom: 20.h, top: 40.h),
          child: Column(
            children: [
              Text(
                "Sign In with social networks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryText,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btnFlatButtonWidget(
                      onPressed: () {
                        controller.handleSignIn();
                      },
                      width: 100.w,
                      height: 50.h,
                      title: 'Google'),
                  SizedBox(
                    width: 20.w,
                  ),
                  btnFlatButtonWidget(
                      onPressed: () {},
                      width: 100.w,
                      height: 50.h,
                      title: 'Facebook'),
                ],
              ),
            ],
          ));
    }

    Widget buildEmailLogIn() {
      return Container(
          width: 300.w,
          margin: EdgeInsets.only(bottom: 40.h),
          child: Column(
            children: [
              Text(
                "Or with your email address",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryText,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ));
    }

    return Scaffold(
        body: Center(
      child: Column(
          children: [buildLogo(), buildThirdPartyLogIn(), buildEmailLogIn()]),
    ));
  }
}
