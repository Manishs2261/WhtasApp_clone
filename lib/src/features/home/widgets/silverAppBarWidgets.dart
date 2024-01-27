import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/features/home/widgets/pop_menu_button.dart';
import 'package:whatsappclone/src/features/home/widgets/tab_widgets.dart';

class SilverAppBarWidgets extends StatelessWidget {
  const SilverAppBarWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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

        PopMenuButtonWidgets()
      ],
      floating: true,
      pinned: true,
      bottom:  TabBar(
        tabs: [
          Tab(
            icon: Icon(
              Icons.people_alt_outlined,
            ),
          ),
          TabWidgets(title: 'Chats', radius: 8, ),
          TabWidgets(title: 'Status', radius: 3, ),
          TabWidgets(title: 'Calls', radius: 3, ),

        ],
      ),
    );
  }
}