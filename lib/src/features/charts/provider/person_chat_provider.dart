import 'package:flutter/foundation.dart';

class PersonChatProvider with ChangeNotifier {
  bool showEmoji = false;
  bool isUploading = false;
  bool removeSpaceKeyBodAndTextFormField = false;

  showEmojiPicker() {
    if (showEmoji) showEmoji = !showEmoji;
    notifyListeners();
  }

  showEmojiPicker1() {
    showEmoji = !showEmoji;
    if (showEmoji) {
      removeSpaceKeyBodAndTextFormField = true;
    } else {
      removeSpaceKeyBodAndTextFormField = false;
    }

    notifyListeners();
  }

  onRemoveSpaceKeyBoard() {
    removeSpaceKeyBodAndTextFormField = true;
  }

  onShowSpace() {
    if (removeSpaceKeyBodAndTextFormField) removeSpaceKeyBodAndTextFormField = false;
  }
}
