import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vengamo_chat_ui/theme/app_color.dart';
import 'package:vengamo_chat_ui/vengamo_chat_ui.dart';

import '../../../core/model/message.dart';
import '../../../utils/helper/my_date_util.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({
    super.key,
    required this.message,
  });

  //for storing all messages
  final Message message;

  @override
  Widget build(BuildContext context) {
    //work incomplete
    if (message.read.isEmpty) {
      //AppApis.updateMessageReadStatus(message);
      print("manish");
    }

    // return Align(
    //   alignment: Alignment.centerRight,
    //   child: ConstrainedBox(
    //     constraints: BoxConstraints(
    //       maxWidth: MediaQuery.of(context).size.width - 45,
    //     ),
    //     child: Card(
    //       elevation: 1,
    //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //       color: const Color(0xffd5ffd0),
    //       margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    //       child: Stack(
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.only(left: 10, right: 70, top: 5, bottom: 20),
    //             child: widget.message.type == Type.text
    //                 ? Text(
    //                     "${widget.message.msg}",
    //                     style: TextStyle(fontSize: 16),
    //                   )
    //                 : CachedNetworkImage(
    //                     imageUrl: widget.message.msg.toString(),
    //                     errorWidget: (context, url, error) => Icon(Icons.image),
    //                   ),
    //           ),
    //           Positioned(
    //             right: 4,
    //             bottom: 4,
    //             child: Row(
    //               children: [
    //                 Text(
    //                   "${MyDateUtil.getFormattedTime(context: context, time: widget.message.sent)}",
    //                   style: TextStyle(fontSize: 12, color: Colors.grey),
    //                 ),
    //                 if (widget.message.read.isNotEmpty)
    //                   Icon(
    //                     Icons.done_all_outlined,
    //                     size: 15,
    //                     color: Colors.blue,
    //                   ),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return message.type == Type.text
        ? VengamoChatUI(
            senderBgColor: AppColors.softGreenColor,
            receiverBgColor: AppColors.white,
            isSender: true,
            isNextMessageFromSameSender: false,
            time: "${MyDateUtil.getFormattedTime(context: context, time: message.sent)}",
            timeLabelColor: AppColors.softBlackcolor,
            text: Text(message.msg.toString()),
            pointer: true,
            ack: Icon(
              Icons.check,
              color: AppColors.iconColor, // You can customize the color here
              size: 13, // You can customize the size here
            ),
          )
        : VengamoChatUI(
            senderBgColor: AppColors.softGreenColor,
            receiverBgColor: AppColors.white,
            timeLabelColor: AppColors.darkModeBackgroundColor,
            isSender: true,
            isNextMessageFromSameSender: false,
            imgUrl: message.msg.toString(),
            //caption: Text("Why did the sun never want to join the galaxy's talent show? Because it didn't want to be a "
            // "star performer, it preferred to shine solo"),
            time: "${MyDateUtil.getFormattedTime(context: context, time: message.sent)}",
            pointer: true,
            ack: Icon(
              Icons.check,
              color: AppColors.iconColor, // You can customize the color here
              size: 13, // You can customize the size here
            ),
          );
  }
}
