import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/core/res/apis/apis.dart';
import 'package:whatsappclone/src/features/home/widgets/pop_menu_button.dart';
import 'package:whatsappclone/src/features/home/widgets/tab_widgets.dart';

import '../../../utils/helper/dialogs.dart';

class SilverAppBarWidgets extends StatefulWidget {
  const SilverAppBarWidgets({
    super.key,
  });

  @override
  State<SilverAppBarWidgets> createState() => _SilverAppBarWidgetsState();
}

class _SilverAppBarWidgetsState extends State<SilverAppBarWidgets> {
  // for storing search status
  bool _isSearching = false;

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
          onPressed: () {
            _addChatUserDialog();
          },
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
        PopMenuButtonWidgets()
      ],
      floating: true,
      pinned: true,
      // bottom: TabBar(
      //   automaticIndicatorColorAdjustment: true,
      //   physics: BouncingScrollPhysics(),
      //   dividerHeight: 0.1,
      //
      //   indicator: BoxDecoration(
      //
      //     borderRadius: BorderRadius.circular(
      //       25.0,
      //     ),
      //     color: Colors.green,
      //   ),
      //   labelColor: Colors.black,
      //   unselectedLabelColor: Colors.white,
      //   tabs: [
      //     Tab(
      //       icon: Icon(
      //         Icons.people_alt_outlined,
      //       ),
      //     ),
      //     TabWidgets(
      //       title: 'Chats',
      //       radius: 8,
      //     ),
      //     TabWidgets(
      //       title: 'Status',
      //       radius: 3,
      //     ),
      //     TabWidgets(
      //       title: 'Calls',
      //       radius: 3,
      //     ),
      //   ],
      // ),
    );
  }

  // for adding new chat user
  void _addChatUserDialog() {
    String email = '';

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              contentPadding: const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 10),

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

              //title
              title: Row(
                children: const [
                  Icon(
                    Icons.person_add,
                    color: Colors.blue,
                    size: 28,
                  ),
                  Text('  Add User')
                ],
              ),

              //content
              content: TextFormField(
                maxLines: null,
                onChanged: (value) => email = value,
                decoration: InputDecoration(
                    hintText: 'Email Id',
                    prefixIcon: const Icon(Icons.email, color: Colors.blue),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
              ),

              //actions
              actions: [
                //cancel button
                MaterialButton(
                    onPressed: () {
                      //hide alert dialog
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel', style: TextStyle(color: Colors.blue, fontSize: 16))),

                //add button
                MaterialButton(
                    onPressed: () async {
                      //hide alert dialog
                      Navigator.pop(context);
                      if (email.isNotEmpty) {
                        await AppApis.addChatUser(email).then((value) {
                          if (!value) {
                            Dialogs.showSnackbar(context, 'User does not Exists!');
                          }
                        });
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ))
              ],
            ));
  }
}
