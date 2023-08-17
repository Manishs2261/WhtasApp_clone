import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/view/home/person_chat_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 310,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer)
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PersonChatPage()));
                              },
                              icon: const Icon(Icons.arrow_back)),
                          CircleAvatar(
                            radius: 65,
                            backgroundColor: Colors.green,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.blue[100],
                              child: const Icon(
                                Icons.person,
                                size: 70,
                              ),
                            ),
                          ),
                          PopupMenuButton<String>(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onSelected: (value) {
                                if (kDebugMode) {
                                  print(value);
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  const PopupMenuItem(
                                    value: "Share",
                                    child: Text("Share"),
                                  ),
                                  const PopupMenuItem(
                                    value: "Edit",
                                    child: Text("Edit"),
                                  ),
                                  const PopupMenuItem(
                                    value: "View in address book",
                                    child: Text("View in address book"),
                                  ),
                                  const PopupMenuItem(
                                    value: "Verify security code",
                                    child: Text("Verify security code"),
                                  )
                                ];
                              })
                        ],
                      ),
                      const Text(
                        "Manish sahu",
                        style: TextStyle(fontSize: 30),
                      ),
                      const Text(
                        "+91 9023562145",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReuseRow(icon: Icons.call, name: "Audio"),
                          const SizedBox(
                            width: 15,
                          ),
                          ReuseRow(icon: Icons.video_call, name: "Video"),
                          const SizedBox(
                            width: 15,
                          ),
                          ReuseRow(
                              icon: Icons.currency_rupee_outlined, name: "Pay"),
                          const SizedBox(
                            width: 15,
                          ),
                          ReuseRow(icon: Icons.search_outlined, name: "Search"),
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                        blurStyle: BlurStyle.outer)
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Success and excuess do not talk together",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "21 August 2021",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                      blurStyle: BlurStyle.outer)
                ]),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Media,links,and docs",
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: [
                          Text(
                            "75",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                      blurStyle: BlurStyle.outer)
                ]),
                child: const Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: Colors.grey,
                      ),
                      title: Text("Mute notification"),
                      trailing: Icon(
                        Icons.toggle_off_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.music_note,
                        color: Colors.grey,
                      ),
                      title: Text("Custom notification"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.photo,
                        color: Colors.grey,
                      ),
                      title: Text("Media visibility"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                      blurStyle: BlurStyle.outer)
                ]),
                child: const Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      title: Text("Encryption"),
                      subtitle: Text(
                          "Messages and calls are end-to-end encrypted Tap to verify"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.access_time_outlined,
                        color: Colors.grey,
                      ),
                      title: Text("Disppering message"),
                      subtitle: Text("off"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.lock_clock_rounded,
                        color: Colors.grey,
                      ),
                      title: Text("Chat lock"),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 12),
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                      blurStyle: BlurStyle.outer)
                ]),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("8 Group in common"),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.group,
                          color: Colors.white,
                        ),
                      ),
                      title: Text("Create group with Manish"),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                      blurStyle: BlurStyle.outer)
                ]),
                child: const Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.block,
                        color: Colors.red,
                      ),
                      title: Text("Block Mansih sahu"),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.thumb_down,
                        color: Colors.red,
                      ),
                      title: Text("Report Mansih sahu"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseRow extends StatelessWidget {
  IconData icon;
  String name;

  ReuseRow({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.green,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
