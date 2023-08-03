import 'package:ecommproject/constants/global_variables.dart';
import 'package:ecommproject/features/admin/screens/products_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBorderWidth = 5;
  List<Widget> pages = [
    const ProductsScreen(),
    const Center(
      child: Text('Page 2'),
    ),
    const Center(
      child: Text('Page 3'),
    )
  ];

  void updatePage(newPage) {
    setState(() {
      _page = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/images/amazon_in.png',
                      height: 40, width: 120),
                ),
                const Text(
                  'Admin',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
          )),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
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
                            color: _page == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBorderWidth))),
                child: const Icon(Icons.home_outlined),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: _page == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: bottomBorderWidth)),
                ),
                child: const Icon(Icons.analytics_outlined),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: _page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor,
                        width: bottomBorderWidth),
                  ),
                ),
                child: const Icon(Icons.all_inbox_outlined),
              ))
        ],
      ),
    );
  }
}
