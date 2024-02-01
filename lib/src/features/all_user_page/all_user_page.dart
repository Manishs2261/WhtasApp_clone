import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatsappclone/src/core/model/message.dart';

import 'package:whatsappclone/src/core/res/apis/apis.dart';
import 'package:whatsappclone/src/features/authentication/login_screen/login_screen.dart';

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

  // for storing searched items
  final List<ChatUser> _searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // //sign out function

            await FirebaseAuth.instance.signOut();
            await GoogleSignIn().signOut();

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));

            //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Contect()));
          },
          backgroundColor: const Color(0xff01937c),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
          child: const Icon(Icons.message),
        ),
        body: StreamBuilder(
          stream: AppApis.getAllUsers(),
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
                        return ChatUserCardWidgets( user: _list[index],);
                      });
                } else {
                  return const Center(
                    child: Text('No Connections Found!', style: TextStyle(fontSize: 20)),
                  );
                }
            }
          },
        ));
  }
}

class ChatUserCardWidgets extends StatefulWidget {
   ChatUserCardWidgets({
    super.key, required this.user}) ;

   final ChatUser user;

  @override
  State<ChatUserCardWidgets> createState() => _ChatUserCardWidgetsState();
}

class _ChatUserCardWidgetsState extends State<ChatUserCardWidgets> {


  Message? message;

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
        stream: AppApis.getLastMessage(widget.user),
        builder: (context, snapshort){


          final data = snapshort.data?.docs;

          final list =
              data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
          if (list.isNotEmpty) message = list[0];


        return  ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PersonChatPage(
                    user: widget.user,
                  )));
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: widget.user.image,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.person),
              ),
            ),
            title: Text(
              "${widget.user.name}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.done_all_outlined,
                  size: 18,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 3,
                ),
                Flexible(
                    child: Text(
                      message != null ? message!.msg
                      : "${widget.user.about}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ))
              ],
            ),
            trailing: const Column(
              children: [
                Text(
                  "12/12/1001",
                  style: TextStyle(fontSize: 12, color: Colors.green),
                ),
                SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.green,
                  child: Text(
                    "55",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
          );

    }
    );

  }
}
