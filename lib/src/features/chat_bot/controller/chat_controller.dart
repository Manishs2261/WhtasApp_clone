import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/res/api_data/api_data.dart';
import '../model/message.dart';


class ChatController extends GetxController {

  final textController = TextEditingController();
  final scrollerController = ScrollController();

  final list = <MessageModel>[MessageModel(msg: "Hello, How can I help you ?", msgType: MessageType.bot)].obs;

  Future<void> askQuestion() async {
    if (textController.text
        .trim()
        .isNotEmpty) {
      list.add(MessageModel(msg: textController.text, msgType: MessageType.user));
      list.add(MessageModel(msg: "", msgType: MessageType.bot));
      scrollDown();
      final res = await Apis.getAnswer(textController.text);
      list.removeLast();
      list.add(MessageModel(msg: res, msgType: MessageType.bot));
       scrollDown();
      textController.text = '';
    }
  }

  void scrollDown() {
    scrollerController.animateTo(scrollerController.position.maxScrollExtent, duration: Duration(microseconds: 500),
        curve: Curves.ease);
  }


}
