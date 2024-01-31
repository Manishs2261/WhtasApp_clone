import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:whatsappclone/src/core/res/apis/apis.dart';
import 'package:whatsappclone/src/features/authentication/login_screen/login_screen.dart';

import '../../core/model/chat_user.dart';
import '../charts/person_chat_page.dart';
import '../contacts/contact.dart';

class AllUserPage extends StatelessWidget {
  AllUserPage({
    super.key,
  });

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
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PersonChatPage(
                                      user: _list[index],
                                    )));
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              imageUrl: _list[index].image,
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.person),
                            ),
                          ),
                          title: Text(
                            "${_list[index].name}",
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
                                "${_list[index].about}",
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
