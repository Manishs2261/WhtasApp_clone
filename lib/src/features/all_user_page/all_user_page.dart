import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../charts/person_chat_page.dart';
import '../contacts/contact.dart';



class AllUserPage extends StatelessWidget {
   AllUserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Contect()));
        },
        backgroundColor: const Color(0xff01937c),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
        child: const Icon(Icons.message),
      ),
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PersonChatPage()));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue[50],
                child: const Icon(
                  Icons.person_outline,
                  size: 30,
                ),
              ),
              title: const Text(
                "Manish SAhu",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: const Row(
                children: [
                  Icon(
                    Icons.done_all_outlined,
                    size: 18,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Flexible(
                      child: Text(
                        "Hello i am manish sshu  ",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ))
                ],
              ),
              trailing: const Column(
                children: [
                  Text(
                    "12/12/1001",
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.green,
                    child: Text(
                      "55",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}