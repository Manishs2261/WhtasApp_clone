import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatsappclone/src/core/model/message.dart';

import 'package:whatsappclone/src/core/res/apis/apis.dart';
import 'package:whatsappclone/src/features/all_user_page/widgets/chat_user_card_widgets.dart';
import 'package:whatsappclone/src/features/authentication/login_screen/login_screen.dart';
import 'package:whatsappclone/src/features/chat_bot/chat_bot.dart';
import 'package:whatsappclone/src/utils/helper/my_date_util.dart';

import '../../core/model/chat_user.dart';
import '../charts/person_chat_page.dart';
import '../contacts/contact.dart';

class AllUserPage extends StatefulWidget {
  AllUserPage({
    super.key,
  });

  @override
  State<AllUserPage> createState() => _AllUserPageState();
}

class _AllUserPageState extends State<AllUserPage> {
  // for storing all users
  List<ChatUser> _list = [];
  bool isFabVisible = true;

  // for storing searched items
  final List<ChatUser> _searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: isFabVisible
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: FloatingActionButton(
                        heroTag: null,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatBot()));
                        },
                        backgroundColor: Colors.green.shade50,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
                        child: Text(
                          "Ai",
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Contect()));
                    },
                    backgroundColor: Colors.green.shade200,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
                    child: const Icon(
                      Icons.messenger_outline,
                      color: Colors.black54,
                    ),
                  ),
                ],
              )
            : null,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     // //sign out function
        //
        //     // await FirebaseAuth.instance.signOut();
        //     // await GoogleSignIn().signOut();
        //
        //  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
        //
        //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Contect()));
        //   },
        //   backgroundColor: const Color(0xff01937c),
        //   shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
        //   child: const Icon(Icons.message),
        // ),
        body: StreamBuilder(
          stream: AppApis.getMyUsersId(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //if data is loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());

              //if some or all data is loaded then show it
              case ConnectionState.active:
              case ConnectionState.done:
                return StreamBuilder(
                  stream: AppApis.getAllUsers(snapshot.data?.docs.map((e) => e.id).toList() ?? []),
                  builder: (BuildContext context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      case ConnectionState.active:
                      // TODO: Handle this case.
                      case ConnectionState.done:
                        // TODO: Handle this case.

                        final data = snapshot.data?.docs;
                        _list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];

                        if (_list.isNotEmpty) {
                          return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: _list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ChatUserCardWidgets(
                                  user: _list[index],
                                );
                              });
                        } else {
                          return const Center(
                            child: Text('No Connections Found!', style: TextStyle(fontSize: 20)),
                          );
                        }
                    }
                  },
                );
            }
          },
        ));
  }
}
