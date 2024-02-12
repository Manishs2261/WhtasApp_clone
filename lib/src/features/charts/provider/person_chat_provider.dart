import 'package:flutter/foundation.dart';

class PersonChatProvider with ChangeNotifier {
  bool showEmoji = false;
  bool isUploading = false;
  bool removeSpaceKeyBodAndTextFormField = false;




  showEmojiPicker(){

    print("hjs");
    if(showEmoji)
      showEmoji = !showEmoji;
    notifyListeners();

  }

  showEmojiPicker1(){

    print("hjs2222");

      showEmoji = !showEmoji;
    notifyListeners();

  }

  onShowSpace(){
    removeSpaceKeyBodAndTextFormField = true;
    notifyListeners();
  }

  onShowFalse(){

    print("false");
    removeSpaceKeyBodAndTextFormField = false;
    notifyListeners();
  }


}
