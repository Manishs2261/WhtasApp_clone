import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vengamo_chat_ui/theme/app_color.dart';
import 'package:whatsappclone/src/core/res/apis/apis.dart';

import '../../../../main.dart';
import '../../../utils/image_constrant/image_constrant.dart';
import '../model/message.dart';

class MessageCardAiBot extends StatelessWidget {
  final MessageModel messageModel;

  const MessageCardAiBot({super.key, required this.messageModel});

  @override
  Widget build(BuildContext context) {
    return messageModel.msgType == MessageType.bot
        ? Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  splashImage,
                  width: 24,
                ),
              ),
              Container(
                  constraints: BoxConstraints(maxWidth: mq.width * 0.7),
                  margin: EdgeInsets.only(bottom: mq.height * .02, left: mq.width * .01),
                  padding: EdgeInsets.symmetric(vertical: mq.height * .01, horizontal: mq.width * .02),
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: messageModel.msg.isEmpty
                      ? AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Please wait ...',
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          repeatForever: true,
                        )
                      : Text(messageModel.msg))
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  constraints: BoxConstraints(maxWidth: mq.width * 0.6),
                  margin: EdgeInsets.only(bottom: mq.height * .02, right: mq.width * .02),
                  padding: EdgeInsets.symmetric(vertical: mq.height * .01, horizontal: mq.width * .02),
                  decoration: BoxDecoration(
                    color: AppColors.softGreenColor,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  child: Text(messageModel.msg)),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(65),
                    child: CachedNetworkImage(
                      width: 150,
                      height: 150,
                      fit: BoxFit.fill,
                      imageUrl: AppApis.me.image,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.person),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
