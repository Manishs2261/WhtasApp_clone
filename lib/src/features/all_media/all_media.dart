


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/model/chat_user.dart';
import '../../core/model/message.dart';
import '../../core/res/apis/apis.dart';

class AllMediaLinkDocs extends StatelessWidget {
  const AllMediaLinkDocs({super.key, required this.user});

  final ChatUser user;

  @override
  Widget build(BuildContext context) {

    List<Message> _list = [];

    return Scaffold(
      body: StreamBuilder(
          stream: AppApis.getAllMessages(user),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data?.docs;
              _list = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];

              if (_list.isNotEmpty) {
                return ListView.builder(
                    reverse: true,
                    itemCount: _list.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _list[index].type == Type.image ?  Image.network(_list[index].msg) : Container();
                    });
              } else {
                return Center(
                  child: Text("Say hello "),
                );
              }
            } else {
              return Container();
            }
          }),
    );
  }
}
