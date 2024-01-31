import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/core/model/chat_user.dart';
import 'package:whatsappclone/src/core/res/apis/apis.dart';

import 'package:whatsappclone/src/features/profile/profile.dart';

import '../../../main.dart';
import '../../core/model/message.dart';
import '../home/Home.dart';

class PersonChatPage extends StatelessWidget {
  const  PersonChatPage({
    super.key,
    required this.user,
  });

  final ChatUser user;

  @override
  Widget build(BuildContext context) {
    //for storing all messages
    List<Message> _list = [];

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(
                              user: user,
                            ),
                        maintainState: false));
              },
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      icon: Icon(Icons.arrow_back)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(mq.height * .03),
                    child: CachedNetworkImage(
                      width: mq.height * .05,
                      height: mq.height * .05,
                      imageUrl: user.image,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Manish"),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            PopupMenuButton(
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      value: "View context",
                      child: Text("View contact"),
                    ),
                    const PopupMenuItem(
                      value: "Media ,links, and docs",
                      child: Text("Media,links,and docs"),
                    ),
                    const PopupMenuItem(
                      value: "Searsh",
                      child: Text("Search"),
                    ),
                    const PopupMenuItem(
                      value: "Mute notification",
                      child: Text("Mute notification"),
                    ),
                    const PopupMenuItem(
                      value: "Disappearring messages",
                      child: Text("Disappearing messages"),
                    ),
                    const PopupMenuItem(
                      value: "Wallpaper",
                      child: Text("Wallpaper"),
                    ),
                    const PopupMenuItem(
                      value: "More",
                      child: Text("More"),
                    ),
                  ];
                })
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: AppApis.getAllMessage(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Center(child: CircularProgressIndicator());
                      case ConnectionState.active:
                      // TODO: Handle this case.
                      case ConnectionState.done:
                      // TODO: Handle this case.
                        final data = snapshot.data?.docs;
                        _list = data
                            ?.map((e) => Message.fromJson(e.data()))
                            .toList() ??
                            [];

                        _list.add(Message(toId: 'xyz',
                            msg: 'Hii',
                            read: '',
                            type: Type.text,
                            fromId: AppApis.user.uid,
                            sent: "12.22"));
                        _list.add(Message(toId: AppApis.user.uid,
                            msg: 'reetu',
                            read: '',
                            type:Type.text,
                            fromId: 'xyd',
                            sent: '14.55'));

                        if (_list.isNotEmpty) {
                          return ListView.builder(
                              itemCount: _list.length,
                              itemBuilder: (context, index) {
                                return MessageCard(message: _list[index]);
                              });
                        } else {
                          return Center(
                            child: Text("Say hello "),
                          );
                        }
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 60,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        margin: const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          onTapOutside: (e) => FocusScope.of(context).unfocus(),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder) => bottomSheet());
                                      },
                                      child: const Icon(Icons.attach_file)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.currency_rupee_outlined),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.camera_alt_outlined),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              hintText: "Type a Message",
                              contentPadding: const EdgeInsets.all(8),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.emoji_emotions_outlined),
                                onPressed: () {},
                              )),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 2, right: 3, bottom: 8),
                      child: CircleAvatar(
                        backgroundColor: Color(0xff01937c),
                        radius: 25,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  //===========bottom sheet ====================
  Widget bottomSheet() {
    return SizedBox(
      height: 360,
      // width: MediaQuery.of(context).size.width - 10,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttomSheetIcon(Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(
                    width: 40,
                  ),
                  buttomSheetIcon(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  buttomSheetIcon(Icons.photo, Colors.purpleAccent, "Gallery"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttomSheetIcon(Icons.audio_file, Colors.orangeAccent, "Audio"),
                  const SizedBox(
                    width: 40,
                  ),
                  buttomSheetIcon(Icons.location_on, Colors.green, "Location"),
                  const SizedBox(
                    width: 40,
                  ),
                  buttomSheetIcon(Icons.currency_rupee_outlined, Colors.lightGreen, "Payment"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttomSheetIcon(Icons.person, Colors.blueAccent, "Contact"),
                  const SizedBox(
                    width: 40,
                  ),
                  buttomSheetIcon(Icons.poll_outlined, Colors.grey, "Poll"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttomSheetIcon(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}


class MessageCard extends StatelessWidget {
   MessageCard({super.key, required this.message});

  //for storing all messages
  final Message message;
  @override
  Widget build(BuildContext context) {
    return AppApis.user.uid == message.fromId
    ? OwnMessageCard()
    : ReplyCard();
  }
}


class OwnMessageCard extends StatelessWidget {
const    OwnMessageCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery
              .of(context)
              .size
              .width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: const Color(0xffd5ffd0),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 80, top: 5, bottom: 20),
                child: Text(
                  "mansih hjkfd gjksdfhgudsfgjk dfkjhdsufkg fjkd",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 4,
                child: Row(
                  children: [
                    Text(
                      "23:21 pm",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Icon(
                      Icons.done_all_outlined,
                      size: 15,
                      color: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReplyCard extends StatelessWidget {
 const   ReplyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery
              .of(context)
              .size
              .width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: const Color(0xfff3fde8),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: const Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 80, top: 5, bottom: 20),
                child: Text(
                  "Hey",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 4,
                child: Text(
                  "23:21 pm",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
