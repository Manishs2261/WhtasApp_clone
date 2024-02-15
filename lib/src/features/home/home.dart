import 'dart:math';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:line_icons/line_icon.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsappclone/src/features/home/provider/provider.dart';
import 'package:whatsappclone/src/features/home/widgets/pop_menu_button.dart';
import 'package:whatsappclone/src/features/home/widgets/silverAppBarWidgets.dart';
import 'package:provider/provider.dart';
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
  late PageController pageController;

  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController = PageController(initialPage: 0);

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
    print('hello');
    return SafeArea(
      top: false,
      right: false,
      left: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Babble",
            style: TextStyle(fontSize: 22, color: Colors.green, letterSpacing: 1, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.green,
              ),
            ),
          ],
        ),
        bottomNavigationBar: GNav(
          rippleColor: Colors.green[300]!,
          hoverColor: Colors.green[100]!,
          gap: 8,
          activeColor: Colors.green,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.green[50]!,
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
              icon: LineIcons.user,
              text: 'Profile',
            ),
          ],
          selectedIndex: pageIndex,
          onTabChange: (index) {

             setState(() {
             pageController.jumpToPage(index);
             });
          },
        ),
        body: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            children: [
              //           // ===========Chats class ===========
              //
              AllUserPage(),
              //           //========Status class=========
              StatusPage(),
              CallsPage(),

              SettingssPage(),
            ]),
      ),
    );
  }
}
