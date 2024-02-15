import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:whatsappclone/src/core/model/chat_user.dart';
import 'package:whatsappclone/src/core/res/apis/apis.dart';
import 'package:whatsappclone/src/features/charts/provider/person_chat_provider.dart';
import 'package:whatsappclone/src/features/charts/widgets/button_sheet_icon.dart';
import 'package:whatsappclone/src/features/charts/widgets/message_card.dart';
import 'package:whatsappclone/src/features/charts/widgets/popup_menu_button_widgets.dart';

import 'package:whatsappclone/src/features/profile/profile.dart';

import '../../../main.dart';
import '../../core/model/message.dart';
import '../../utils/helper/my_date_util.dart';
import '../home/Home.dart';

class PersonChatPage extends StatelessWidget {
  PersonChatPage({
    super.key,
    required this.user,
  });

  final ChatUser user;

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<PersonChatProvider>(context);

    print("person chat screen ");
    //for storing all messages
    List<Message> _list = [];

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (chatProvider.showEmoji) {
          chatProvider.showEmojiPicker();
          chatProvider.isPop = false;
        }
      },
      child: SafeArea(
        top: false,
        right: false,
        left: false,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: StreamBuilder(
                    stream: AppApis.getUserInfo(user),
                    builder: (context, sanpshot) {
                      final data = sanpshot.data?.docs;
                      final list = data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                        user: user,
                                      ),
                                  maintainState: false));
                        },
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => HomeScreen()));
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.green,
                                )),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(mq.height * .03),
                              child: CachedNetworkImage(
                                width: mq.height * .05,
                                height: mq.height * .05,
                                imageUrl: list.isNotEmpty ? list[0].image : user.image,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.person),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  list.isNotEmpty ? list[0].name : user.name,
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  list.isNotEmpty
                                      ? list[0].isOnline
                                          ? 'Online'
                                          : MyDateUtil.getLastActiveTime(
                                              context: context, lastActive: list[0].lastActive)
                                      : MyDateUtil.getLastActiveTime(context: context, lastActive: user.lastActive),
                                  style: TextStyle(fontSize: 12, color: Colors.green),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  )),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.green,
                    )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.call, color: Colors.green)),
                PopupMenuButtonWidgets()
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
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
                                    return MessageCard(message: _list[index]);
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
                  ),
                  if (context.watch<PersonChatProvider>().isUploading)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 70,
                          child: Card(
                            color: Colors.green.shade50,
                            elevation: 1,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            child: TextFormField(
                              controller: _textController,
                              onTap: () {
                                context.read<PersonChatProvider>().showEmojiPicker();
                              },
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              onChanged: (value) {},
                              onTapOutside: (e) {
                                FocusScope.of(context).unfocus();
                              },
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
                                                builder: (builder) {
                                                  return SizedBox(
                                                    height: 360,
                                                    // width: MediaQuery.of(context).size.width - 10,
                                                    child: Card(
                                                      margin: const EdgeInsets.all(18),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                ButtonSheetIcon(
                                                                  icon: Icons.insert_drive_file,
                                                                  color: Colors.indigo,
                                                                  text: "Document",
                                                                  onPressed: () {
                                                                    print("document");
                                                                  },
                                                                ),
                                                                const SizedBox(
                                                                  width: 40,
                                                                ),
                                                                ButtonSheetIcon(
                                                                  icon: Icons.camera_alt,
                                                                  color: Colors.pink,
                                                                  text: "Camera",
                                                                  onPressed: () {
                                                                    print("camera");
                                                                  },
                                                                ),
                                                                const SizedBox(
                                                                  width: 40,
                                                                ),
                                                                ButtonSheetIcon(
                                                                  icon: Icons.photo,
                                                                  color: Colors.purpleAccent,
                                                                  text: "Gallery",
                                                                  onPressed: () async {
                                                                    final ImagePicker picker = ImagePicker();

                                                                    // Pick an image
                                                                    final List<XFile> images =
                                                                        await picker.pickMultiImage(imageQuality: 70);

                                                                    for (var i in images) {
                                                                      context.read<PersonChatProvider>().isUploading =
                                                                          true;

                                                                      await AppApis.sendChatImage(user, File(i.path));

                                                                      context.read<PersonChatProvider>().isUploading =
                                                                          false;
                                                                    }
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                ButtonSheetIcon(
                                                                  icon: Icons.audio_file,
                                                                  color: Colors.orangeAccent,
                                                                  text: "Audio",
                                                                  onPressed: () {
                                                                    print("audio");
                                                                  },
                                                                ),
                                                                const SizedBox(
                                                                  width: 40,
                                                                ),
                                                                ButtonSheetIcon(
                                                                  icon: Icons.location_on,
                                                                  color: Colors.green,
                                                                  text: "Location",
                                                                  onPressed: () {
                                                                    print("location");
                                                                  },
                                                                ),
                                                                const SizedBox(
                                                                  width: 40,
                                                                ),
                                                                ButtonSheetIcon(
                                                                  icon: Icons.currency_rupee_outlined,
                                                                  color: Colors.lightGreen,
                                                                  text: "Payment",
                                                                  onPressed: () {
                                                                    print("paymet");
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                ButtonSheetIcon(
                                                                  icon: Icons.person,
                                                                  color: Colors.blueAccent,
                                                                  text: "Contact",
                                                                  onPressed: () {
                                                                    print("contact");
                                                                  },
                                                                ),
                                                                const SizedBox(
                                                                  width: 40,
                                                                ),
                                                                ButtonSheetIcon(
                                                                  icon: Icons.poll_outlined,
                                                                  color: Colors.grey,
                                                                  text: "Poll",
                                                                  onPressed: () {
                                                                    print("ploo");
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: const Icon(Icons.attach_file)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          final ImagePicker picker = ImagePicker();

                                          // Pick an image
                                          final XFile? image =
                                              await picker.pickImage(source: ImageSource.camera, imageQuality: 70);
                                          if (image != null) {
                                            context.read<PersonChatProvider>().isUploading = true;

                                            await AppApis.sendChatImage(user, File(image.path));
                                            context.read<PersonChatProvider>().isUploading = false;
                                          }
                                        },
                                        icon: Icon(Icons.camera_alt_outlined),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                  hintText: "Type a Message",
                                  contentPadding: const EdgeInsets.all(8),
                                  prefixIcon: IconButton(
                                    icon: const Icon(Icons.emoji_emotions_outlined),
                                    onPressed: () {
                                      context.read<PersonChatProvider>().showEmojiPicker1();
                                      FocusScope.of(context).unfocus();
                                    },
                                  )),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (_textController.text.isNotEmpty) {
                              AppApis.sendMessage(user, _textController.text, Type.text);
                              _textController.text = "";
                            }
                          },
                          child: CircleAvatar(
                              backgroundColor: Color(0xff01937c),
                              radius: 25,
                              child: Icon(
                                Icons.send_outlined,
                                color: Colors.white,
                                size: 30,
                              )),
                        )
                      ],
                    ),
                  ),
                  if (context.watch<PersonChatProvider>().showEmoji)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: EmojiPicker(
                        onBackspacePressed: () {
                          // Do something when the user taps the backspace button (optional)
                          // Set it to null to hide the Backspace-Button
                        },
                        textEditingController: _textController, // pass here the same [TextEditingController] that is
                        // connected to your input field, usually a [TextFormField]
                        config: Config(
                          emojiViewConfig: EmojiViewConfig(
                            backgroundColor: Colors.white,
                          ),
                          skinToneConfig: const SkinToneConfig(),
                          categoryViewConfig: CategoryViewConfig(
                            backgroundColor: Colors.green.shade50,
                            iconColorSelected: Colors.green,
                            indicatorColor: Colors.green,
                          ),
                          bottomActionBarConfig: const BottomActionBarConfig(
                            enabled: false,
                          ),
                          searchViewConfig: const SearchViewConfig(),
                        ),
                      ),
                    )
                ],
              ),
            )),
      ),
    );
  }
}
