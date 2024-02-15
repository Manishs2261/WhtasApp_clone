import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../../core/res/apis/apis.dart';

class HomeProvider with ChangeNotifier {
  int pageIndex = 0;

   //PageController pageViewController =   PageController(initialPage:  0);


  HomeProvider(){


    AppApis.getSelfInfo();

    SystemChannels.lifecycle.setMessageHandler((message) {
      print(message);

      if (AppApis.auth.currentUser != null) {
        if (message.toString().contains('resume')) AppApis.updateActiveStatus(true);

        if (message.toString().contains('pause')) AppApis.updateActiveStatus(false);
      }

      return Future.value(message);
    });
  }


  onPageViewChange(index) {
    pageIndex = index;

    print(" onPageViewChange");
    notifyListeners();
  }

  onPageViewSelected(index) {
    print(" onPageViewSelected");

   pageIndex = index;

   // pageViewController.jumpToPage(index);
  //   pageViewController.animateToPage(
  //     index,
  //     duration: Duration(milliseconds: 500),
  //     curve: Curves.ease,
  //   );
    print(" onPageViewSelected ==3 ");
    //notifyListeners();
  }


}
