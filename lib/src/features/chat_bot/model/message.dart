class MessageModel {
  String msg;
  final MessageType msgType;

  MessageModel({required this.msg,required this.msgType});
}

enum MessageType{user, bot}