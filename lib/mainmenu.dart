import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fooddelivery/constants.dart';
import 'package:fooddelivery/services/loginRequest.dart';
import 'package:fooddelivery/views/discover.dart';
import 'package:fooddelivery/views/homepage.dart';
import 'package:fooddelivery/views/orders.dart';

int bottomSelectedIndex = 0;

List<BottomNavigationBarItem> buildBottomNavBarItems() {
  return [
    BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
      icon: new Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
  ];
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    loginRequest().sendRequest();
    super.initState();
  }

  /*@override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }*/
  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      Constant.screensPageViewController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                allowImplicitScrolling: true,
                physics: NeverScrollableScrollPhysics(),
                controller: Constant.screensPageViewController,
                onPageChanged: (index) {
                  setState(() {
                    bottomSelectedIndex = index;
                  });
                },
                children: [MyHomePage(), DiscoverPage(), OrderPage()],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          iconSize: 20,
          elevation: 5,
          selectedIconTheme: IconThemeData(size: 30.sp),
          currentIndex: bottomSelectedIndex,
          items: buildBottomNavBarItems(),
          onTap: (index) {
            Constant.screensPageViewController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          },
        ),
      ),
    );
  }
}
