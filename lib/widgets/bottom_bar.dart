import 'package:ecommproject/constants/global_variables.dart';
import 'package:ecommproject/features/account/screen/account_screen.dart';
import 'package:ecommproject/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routename = "/actual-home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text('Cart'),
    )
  ];

  void updatePage(int num) {
    setState(() {
      page = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: page == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBarBorderWidth))),
                child: const Icon(Icons.home_outlined),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: page == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBarBorderWidth))),
                child: const Icon(Icons.person_outline_outlined),
              )),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: page == 2
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBarBorderWidth))),
              child: const badges.Badge(
                badgeContent: Text('2'),
                badgeStyle:
                    badges.BadgeStyle(badgeColor: Colors.white, elevation: 0),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
          )
        ],
      ),
    );
  }
}
