import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
   GroupPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 80,
            child: Card(
              child: ListTile(
                leading: Stack(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400, borderRadius: const BorderRadius.all(Radius.elliptical(15, 15))),
                      child: const Icon(
                        Icons.group,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 24,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                title: const Text(
                  "New community",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        });
  }
}