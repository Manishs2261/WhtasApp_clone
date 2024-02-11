//custom options card (for copy, edit, delete, etc.)
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';

class OnPressShowButton extends StatelessWidget {
  final Icon icon;
  final String name;
  final VoidCallback onTap;

  const OnPressShowButton({required this.icon, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: EdgeInsets.only(left: mq.width * .05, top: mq.height * .015, bottom: mq.height * .015),
          child: Row(children: [
            icon,
            Flexible(
                child:
                    Text('    $name', style: const TextStyle(fontSize: 15, color: Colors.black54, letterSpacing: 0.5)))
          ]),
        ));
  }
}
