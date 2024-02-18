import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whatsappclone/src/features/chat_bot/widets/message_card_ai.dart';

import '../../core/res/apis/apis.dart';
import 'controller/chat_controller.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final controller = Get.put(ChatController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppApis.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      right: false,
      left: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat Bot AI"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: controller.textController,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                    fillColor: Colors.green.shade50,
                    filled: true,
                    isDense: true,

                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),

                    hintText: "Message Eden Ai....."),
              )),
              SizedBox(
                width: 5,
              ),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.teal,
                child: IconButton(
                  onPressed: controller.askQuestion,
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              )
            ],
          ),
        ),
        body: Obx(
          () => ListView(
            physics: BouncingScrollPhysics(),
            controller: controller.scrollerController,
            children: controller.list.map((element) => MessageCardAiBot(messageModel: element)).toList(),
          ),
        ),
      ),
    );
  }
}
