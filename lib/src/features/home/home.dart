import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/features/home/widgets/pop_menu_button.dart';
import 'package:whatsappclone/src/features/home/widgets/silverAppBarWidgets.dart';

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
  @override
  Widget build(BuildContext context) {
    int tabCount = 4;

    return DefaultTabController(
      initialIndex: 1,
      length: tabCount,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScroll) {
            return <Widget>[
              SilverAppBarWidgets(),
            ];
          },
          body: TabBarView(
            children: [
              //=====Group class ================

              GroupPage(),
              // ===========Chats class ===========

              AllUserPage(),
              //========Status class=========
              StatusPage(),
              CallsPage()

              //========Calls class===========
            ],
          ),
        ),
      ),
    );
  }
}
