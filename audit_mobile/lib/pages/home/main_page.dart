import 'package:audit_mobile/pages/home/chat_page.dart';
import 'package:audit_mobile/pages/home/home_page.dart';
import 'package:audit_mobile/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    Widget plusButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_plus.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_home.png',
                  width: 21,
                  color: currentIndex == 0 ? primaryColor : Color(0xff808191),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon_chat.png',
                  width: 18,
                  color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                ),
                label: 'Chat',
              ),
            ],
          ),
        ),
      );
    }
    
    Widget body() {
      return IndexedStack(
        index: currentIndex,
        children: [
          HomePage(),
          ChatPage(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: plusButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}