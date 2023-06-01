// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chat/common/values/values.dart';
import 'package:chat/pages/application/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView() {
      return PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handlePageChanged,
        children: const [Text('Chat'), Text('Contact'), Text('Profile')],
      );
    }

    Widget _buildBottomNavBar() {
      return Obx(() => BottomNavigationBar(
            items: controller.bottomTabs,
            currentIndex: controller.state.page,
            type: BottomNavigationBarType.fixed,
            onTap: controller.handleNavBarPage,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedItemColor: AppColors.tabBarElement,
            selectedItemColor: AppColors.thirdElement,
          ));
    }

    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.only(left: 20.w), child: _buildPageView()),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
