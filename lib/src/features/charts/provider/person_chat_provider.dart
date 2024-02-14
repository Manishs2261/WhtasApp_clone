import 'package:flutter/foundation.dart';

class PersonChatProvider with ChangeNotifier {
  bool showEmoji = false;
  bool isUploading = false;
  bool isPop  = false;

  showEmojiPicker() {
    if (showEmoji) showEmoji = !showEmoji;
    notifyListeners();
  }

  showEmojiPicker1() {
    showEmoji = !showEmoji;

    notifyListeners();
  }
}
