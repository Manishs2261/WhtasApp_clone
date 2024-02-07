import 'dart:math';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsappclone/src/features/home/widgets/pop_menu_button.dart';
import 'package:whatsappclone/src/features/home/widgets/silverAppBarWidgets.dart';

import '../../core/res/apis/apis.dart';
import '../all_user_page/all_user_page.dart';
import '../calls/call_screen.dart';
import '../group/group_page.dart';
import '../settings/Settings.dart';
import '../status/status_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final _pageViewController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AppApis.getSelfInfo();

    SystemChannels.lifecycle.setMessageHandler((message) {
      print(message);

      if (AppApis.auth.currentUser != null) {
        if (message.toString().contains('resume')) AppApis.updateActiveStatus(true);

        if (message.toString().contains('pause')) AppApis.updateActiveStatus(false);
      }

      return Future.value(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    int tabCount = 4;

    // return DefaultTabController(
    //   initialIndex: 1,
    //   length: tabCount,
    //   child: Scaffold(
    //     body: NestedScrollView(
    //       headerSliverBuilder: (BuildContext context, bool innerBoxScroll) {
    //         return <Widget>[
    //           SilverAppBarWidgets(),
    //         ];
    //       },
    //       body: TabBarView(
    //         children: [
    //           //=====Group class ================
    //
    //           GroupPage(),
    //           // ===========Chats class ===========
    //
    //           AllUserPage(),
    //           //========Status class=========
    //           StatusPage(),
    //           CallsPage()
    //
    //           //========Calls class===========
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "WhatsApp",
          style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing: 1),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageViewController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: [
          //           // ===========Chats class ===========
          //
          AllUserPage(),
          //           //========Status class=========
          StatusPage(),
          CallsPage(),
          CallsPage(),
          SettingssPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: GNav(
          rippleColor: Colors.green[300]!,
          hoverColor: Colors.green[100]!,
          gap: 8,
          activeColor: Colors.green,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: Colors.black,
          tabs: [
            GButton(
              icon: LineIcons.rocketChat,
              text: 'Chats',
            ),
            GButton(
              icon: LineIcons.laughingWinkingFace,
              text: 'Updates',
            ),
            GButton(
              icon: LineIcons.phone,
              text: 'Calls',
            ),
            GButton(
              icon: LineIcons.userFriends,
              text: 'Groups',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profile',
            ),
          ],
          selectedIndex: _pageIndex,
          onTabChange: (index) {
            setState(() {
              _pageIndex = index;
              _pageViewController.animateToPage(
                index,
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
              );
            });
          },
        ),
      ),
    );
  }
}
