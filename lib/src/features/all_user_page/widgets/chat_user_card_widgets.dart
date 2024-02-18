import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/core/model/message.dart';

import '../../../core/model/chat_user.dart';
import '../../../core/res/apis/apis.dart';
import '../../../utils/helper/my_date_util.dart';
import '../../charts/person_chat_page.dart';

class ChatUserCardWidgets extends StatefulWidget {
  ChatUserCardWidgets({super.key, required this.user});

  final ChatUser user;

  @override
  State<ChatUserCardWidgets> createState() => _ChatUserCardWidgetsState();
}

class _ChatUserCardWidgetsState extends State<ChatUserCardWidgets> {
  Message? message;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AppApis.getLastMessage(widget.user),
        builder: (context, snapshort) {
          final data = snapshort.data?.docs;

          final list = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
          if (list.isNotEmpty) message = list[0];

          return ListTile(
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
                    message != null
                        ? message!.type == Type.image
                            ? 'image'
                            : message!.msg
                        : "${widget.user.about}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ))
                ],
              ),
              trailing: message == null
                  ? null
                  : message!.read.isEmpty && message!.fromId != AppApis.user.uid
                      ? Text("${MyDateUtil.getLastMessageTime(context: context, time: message!.sent)}")
                      : Text("${MyDateUtil.getLastMessageTime(context: context, time: message!.sent)}")

          );
        });
  }
}
