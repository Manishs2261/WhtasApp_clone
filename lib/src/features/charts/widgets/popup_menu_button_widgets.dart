import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupMenuButtonWidgets extends StatelessWidget {
  const PopupMenuButtonWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return PopupMenuButton(
        offset: const Offset(0, -580),
        iconColor: Colors.green,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: "View context",
              child: Text("View contact"),
            ),
            const PopupMenuItem(
              value: "Media ,links, and docs",
              child: Text("Media,links,and docs"),
            ),
            const PopupMenuItem(
              value: "Searsh",
              child: Text("Search"),
            ),
            const PopupMenuItem(
              value: "Mute notification",
              child: Text("Mute notification"),
            ),
            const PopupMenuItem(
              value: "Disappearring messages",
              child: Text("Disappearing messages"),
            ),
            const PopupMenuItem(
              value: "Wallpaper",
              child: Text("Wallpaper"),
            ),
            const PopupMenuItem(
              value: "More",
              child: Text("More"),
            ),
          ];
        });
  }
}
