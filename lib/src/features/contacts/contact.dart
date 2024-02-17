import 'package:flutter/material.dart';

class Contect extends StatefulWidget {
  const Contect({super.key});

  @override
  State<Contect> createState() => _ContectState();
}

class _ContectState extends State<Contect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select contact",
              style: TextStyle(fontSize: 20, color: Colors.black87, letterSpacing: 1, ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "150 contact",
              style: TextStyle(fontSize: 13, color: Colors.green),
            ),
          ],
        ),
        actions: [
          const Icon(
            Icons.search_outlined,
            size: 30,
            color: Colors.green,
          ),
          PopupMenuButton(

        iconColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: "Invite a friend",
                    child: Text("Invite a friend"),
                  ),
                  const PopupMenuItem(
                    value: "Contects",
                    child: Text("Contacts"),
                  ),
                  const PopupMenuItem(
                    value: "Refresh",
                    child: Text("Refresh"),
                  ),
                  const PopupMenuItem(
                    value: "Help",
                    child: Text("Help"),
                  ),
                ];
              })
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ListTile(
                title: const Text(
                  "New group",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.red[100],
                  child: const Icon(Icons.group),
                ),
              );
            } else if (index == 1) {
              return ListTile(
                title: const Text(
                  "New contact",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.red[100],
                  child: const Icon(Icons.person_add),
                ),
                trailing: const Icon(
                  Icons.qr_code,
                  color: Colors.green,
                ),
              );
            } else if (index == 2) {
              return ListTile(
                title: const Text(
                  "New community",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.red[100],
                  child: const Icon(Icons.group),
                ),
              );
            } else if (index == 3) {
              return const Padding(
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Text(
                  "Contacts on WhatsApp",
                  style: TextStyle(color: Colors.black54),
                ),
              );
            }
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: const Icon(Icons.person),
              ),
              subtitle: const Text("tag line "),
              title: const Text(
                "Rahul",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }),
    );
  }
}
