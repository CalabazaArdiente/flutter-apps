import 'package:chat/pages/welcome/index.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: 360.w,
          height: 780.w,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                scrollDirection: Axis.horizontal,
                reverse: false,
                onPageChanged: (index) {
                  controller.changePage(index);
                },
                controller: PageController(
                    initialPage: 0, keepPage: false, viewportFraction: 1),
                pageSnapping: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/banner1.png'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/banner2.png'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/banner3.png'),
                            fit: BoxFit.cover)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            child: SizedBox(
                          width: 200.w,
                          height: 150.w,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.handleSignIN();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            child: Ink(
                                decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/button1.png'),
                                fit: BoxFit.cover,
                              ),
                            )),
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 70,
                  child: DotsIndicator(
                    position: controller.state.index.value,
                    dotsCount: 3,
                    reversed: false,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        size: const Size.square(9),
                        activeSize: const Size(18, 9),
                        activeColor: Colors.amber[700],
                        color: Colors.black12,
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
