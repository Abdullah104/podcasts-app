import 'package:flutter/material.dart';
import 'package:podcasts_app/custom_icons_icons.dart';
import 'package:podcasts_app/services/layout_service.dart';
import 'package:podcasts_app/services/locator.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final layoutService = locator<LayoutService>();

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Color(0xffBEBEBE),
      backgroundColor: Colors.white,
      elevation: 3,
      onTap: updatePage,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsetsGeometry.only(top: 10),
            child: Icon(CustomIcons.list_ul_solid),
          ),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsetsGeometry.only(top: 10),
            child: Icon(CustomIcons.microphone_solid),
          ),
          label: 'New',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsetsGeometry.only(top: 10),
            child: Icon(CustomIcons.user_alt_solid),
          ),
          label: 'Profile',
        ),
      ],
    );
  }

  void updatePage(int index) =>
      layoutService.globalPageController.animateToPage(
        index,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
}
