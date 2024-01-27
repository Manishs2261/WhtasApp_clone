import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contacts/contact.dart';

class CallsPage extends StatelessWidget {
   CallsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff01937c),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Contect()));
        },
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
        child: const Icon(
          Icons.add_ic_call_rounded,
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ListTile(
                title: const Text(
                  "Create call link",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: const Text("Share a link your WhatsApp call"),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.red[100],
                  child: const Icon(Icons.link),
                ),
              );
            } else if (index == 1) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Text(
                  "Recent",
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              );
            } else {
              return ListTile(
                title: const Text(
                  "Create call link",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: const Row(
                  children: [
                    Icon(
                      Icons.call_received_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Yesterday 3:04 pm"),
                  ],
                ),
                leading: CircleAvatar(radius: 25, backgroundColor: Colors.blue[50], child: const Icon(Icons.link)),
                trailing: const Icon(
                  Icons.call,
                  color: Colors.green,
                ),
              );
            }
          }),
    );
  }
}