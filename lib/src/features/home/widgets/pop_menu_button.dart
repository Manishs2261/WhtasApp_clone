import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../settings/Settings.dart';

class PopMenuButtonWidgets extends StatelessWidget {
  const PopMenuButtonWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        color: Colors.white,
        iconColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onSelected: (value) {
          if (value == 5) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingssPage()));
          } else {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingssPage()));
          }

          if (kDebugMode) {
            print(value);
          }
        },
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: "0",
              child: PopUpMenuItemRow(),
            ),
            const PopupMenuItem(
              value: "1",
              child: Text("New broadcst"),
            ),
            const PopupMenuItem(
              value: "2",
              child: Text("Linked devices"),
            ),
            const PopupMenuItem(
              value: "3",
              child: Text("Starred messages"),
            ),
            const PopupMenuItem(
              value: "4",
              child: Text("Payments"),
            ),
            const PopupMenuItem(
              value: "5",
              child: Text("Settings"),
            ),
          ];
        });
  }
}

class PopUpMenuItemRow extends StatelessWidget {
  const PopUpMenuItemRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Icon(Icons.group), Text("New group")],
    );
  }
}
