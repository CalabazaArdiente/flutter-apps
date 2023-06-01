import 'package:chat/common/values/values.dart';
import 'package:chat/pages/application/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  final state = ApplicationState();
  ApplicationController();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handlePageChanged(int index) {
    state.page = index;
  }

  void handleNavBarPage(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    tabTitles = ['Chat', 'Contact', 'Profile'];
    bottomTabs = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.message,
            color: AppColors.thirdElement,
          ),
          activeIcon: Icon(
            Icons.message,
            color: AppColors.secondaryElementText,
          ),
          label: 'Chat',
          backgroundColor: AppColors.primaryBackground),

      // CONTACTS
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.child_friendly,
            color: AppColors.thirdElement,
          ),
          activeIcon: Icon(
            Icons.child_friendly,
            color: AppColors.secondaryElementText,
          ),
          label: 'Contact',
          backgroundColor: AppColors.primaryBackground),

      //PROFILE
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: AppColors.thirdElement,
          ),
          activeIcon: Icon(
            Icons.person,
            color: AppColors.secondaryElementText,
          ),
          label: 'Profile',
          backgroundColor: AppColors.primaryBackground),
    ];

    pageController = PageController(initialPage: state.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
