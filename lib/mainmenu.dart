import 'package:flutter/material.dart';
import 'package:fooddelivery/screens/discover.dart';
import 'package:fooddelivery/screens/homepage.dart';
import 'package:fooddelivery/screens/orders.dart';

int bottomSelectedIndex = 0;
List<BottomNavigationBarItem> buildBottomNavBarItems() {
  return [
    BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
      icon: new Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Orders'),
  ];
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

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
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView(
                allowImplicitScrolling: true,
                physics: AlwaysScrollableScrollPhysics(),
                controller: _pageController,
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
          elevation: 5,
          selectedIconTheme: IconThemeData(size: 30),
          currentIndex: bottomSelectedIndex,
          items: buildBottomNavBarItems(),
          onTap: (index) {
            bottomTapped(index);
          },
        ),
      ),
    );
  }
}
