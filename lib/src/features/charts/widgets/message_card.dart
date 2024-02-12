import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:whatsappclone/src/features/charts/widgets/reply_message_card.dart';
import 'package:whatsappclone/src/features/charts/widgets/send_message_card.dart';

import '../../../../main.dart';
import '../../../core/model/message.dart';
import '../../../core/res/apis/apis.dart';
import '../../../utils/helper/dialogs.dart';
import '../../../utils/helper/my_date_util.dart';
import 'onpress_show_button.dart';

class MessageCard extends StatefulWidget {
  MessageCard({super.key, required this.message});

  //for storing all messages
  final Message message;

  @override
  State<MessageCard> createState() => MessageCardState();
}

class MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    bool isMe = AppApis.user.uid == widget.message.fromId;
    return InkWell(
        onLongPress: () {
          _showBottomSheet(isMe);

        },
        child: isMe
            ? OwnMessageCard(
          message: widget.message,
        )
            : ReplyCard(message: widget.message));
  }

  // bottom sheet for modifying message details
  void _showBottomSheet(bool isMe) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (_) {
          return ListView(
            shrinkWrap: true,
            children: [
              //black divider
              Container(
                height: 4,
                margin: EdgeInsets.symmetric(vertical: mq.height * .015, horizontal: mq.width * .4),
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              ),

              widget.message.type == Type.text
                  ?
              //copy option
              OnPressShowButton(
                  icon: const Icon(Icons.copy_all_rounded, color: Colors.blue, size: 26),
                  name: 'Copy Text',
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: widget.message.msg)).then((value) {
                      //for hiding bottom sheet
                      Navigator.pop(context);

                      Dialogs.showSnackbar(context, 'Text Copied!');
                    });
                  })
                  :
              //save option
              OnPressShowButton(
                  icon: const Icon(Icons.download_rounded, color: Colors.blue, size: 26),
                  name: 'Save Image',
                  onTap: () async {
                    try {
                      //  log('Image Url: ${widget.message.msg}');
                      await GallerySaver.saveImage(widget.message.msg, albumName: 'We Chat').then((success) {
                        //for hiding bottom sheet
                        Navigator.pop(context);
                        if (success != null && success) {
                          Dialogs.showSnackbar(context, 'Image Successfully Saved!');
                        }
                      });
                    } catch (e) {
                      //log('ErrorWhileSavingImg: $e');
                    }
                  }),

              //separator or divider
              if (isMe)
                Divider(
                  color: Colors.black54,
                  endIndent: mq.width * .04,
                  indent: mq.width * .04,
                ),

              //edit option
              if (widget.message.type == Type.text && isMe)
                OnPressShowButton(
                    icon: const Icon(Icons.edit, color: Colors.blue, size: 26),
                    name: 'Edit Message',
                    onTap: () {
                      //for hiding bottom sheet
                      Navigator.pop(context);

                      _showMessageUpdateDialog();
                    }),

              //delete option
              if (isMe)
                OnPressShowButton(
                    icon: const Icon(Icons.delete_forever, color: Colors.red, size: 26),
                    name: 'Delete Message',
                    onTap: () async {
                      await AppApis.deleteMessage(widget.message).then((value) {
                        //for hiding bottom sheet
                        Navigator.pop(context);
                      });
                    }),

              //separator or divider
              Divider(
                color: Colors.black54,
                endIndent: mq.width * .04,
                indent: mq.width * .04,
              ),

              //sent time
              OnPressShowButton(
                  icon: const Icon(Icons.remove_red_eye, color: Colors.blue),
                  name: 'Sent At: ${MyDateUtil.getMessageTime(context: context, time: widget.message.sent)}',
                  onTap: () {}),

              //read time
              OnPressShowButton(
                  icon: const Icon(Icons.remove_red_eye, color: Colors.green),
                  name: widget.message.read.isEmpty
                      ? 'Read At: Not seen yet'
                      : 'Read At: ${MyDateUtil.getMessageTime(context: context, time: widget.message.read)}',
                  onTap: () {}),
            ],
          );
        });
  }

  //dialog for updating message content
  void _showMessageUpdateDialog() {
    String updatedMsg = widget.message.msg;

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          contentPadding: const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 10),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

          //title
          title: Row(
            children: const [
              Icon(
                Icons.message,
                color: Colors.blue,
                size: 28,
              ),
              Text(' Update Message')
            ],
          ),

          //content
          content: TextFormField(
            initialValue: updatedMsg,
            maxLines: null,
            onChanged: (value) => updatedMsg = value,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
          ),

          //actions
          actions: [
            //cancel button
            MaterialButton(
                onPressed: () {
                  //hide alert dialog

                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                )),

            //update button
            MaterialButton(
                onPressed: () {
                  //hide alert dialog

                  if (context.mounted) {
                    setState(() {
                      Navigator.pop(context);
                      AppApis.updateMessage(widget.message, updatedMsg);
                    });
                  }
                },
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ))
          ],
        ));
  }
}
