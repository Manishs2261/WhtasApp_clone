import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/view/home/Settings.dart';
import 'package:whatsappclone/src/view/home/person_chat_page.dart';
import 'contact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int tabCount = 4;

    return DefaultTabController(
      initialIndex: 1,
      length: tabCount,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScroll) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                title: const Text(
                  "WhatsApp",
                  style: TextStyle(
                      fontSize: 22, color: Colors.white, letterSpacing: 1),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                    ),
                  ),
                  PopupMenuButton<String>(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onSelected: (value) {
                        if (value == 5) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SettingssPage()));
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SettingssPage()));
                        }

                        if (kDebugMode) {
                          print(value);
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem(
                            value: "0",
                            child: Text("New group"),
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
                      })
                ],
                floating: true,
                pinned: true,
                bottom: const TabBar(
                  tabs: <Tab>[
                    Tab(
                      icon: Icon(
                        Icons.people_alt_outlined,
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Text(
                            "Chats",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 8,
                            child: Text(
                              "9",
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Text(
                            "Status",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white70,
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Text(
                            "Calls",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.white70,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ];
          },
          body: const TabBarView(
            children: [
              //=====Group class ================

             GroupPage(),
              // ===========Chats class ===========
              ChatsPage(),

              //========Status class=========
              StatusPage(),
              //========Calls class===========
              CallsPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class GroupPage extends StatelessWidget {
  const GroupPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return    ListView.builder(
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
                          color: Colors.grey.shade400,
                          borderRadius:
                          const BorderRadius.all(Radius.elliptical(15, 15))),
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

class CallsPage extends StatelessWidget {
  const CallsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff01937c),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Contect()));
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
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
                padding:
                    EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: Text(
                  "Recent",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
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
                leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue[50],
                    child: const Icon(Icons.link)),
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

class StatusPage extends StatelessWidget {
  const StatusPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.green.shade50,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
              child: const Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xff01937c),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
            child: const Icon(
              Icons.camera_alt,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ListTile(
                leading: Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red[100],
                          border: Border.all(color: Colors.green, width: 3)),
                      child: const Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      top: 28,
                      left: 28,
                      child: Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                title: const Text(
                  "My status",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Tap to add status update"),
                trailing: const Icon(
                  Icons.more_vert,
                  color: Colors.green,
                ),
              );
            } else if (index == 1) {
              return const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Recent updates",
                ),
              );
            } else if (index < 6) {
              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue[50],
                      border: Border.all(color: Colors.green, width: 3)),
                  child: const Icon(Icons.person),
                ),
                title: const Text(
                  "Manish sahu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Today, 12:20 PM"),
              );
            } else if (index == 6) {
              return const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("Viewed updates"),
              );
            } else {
              return ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue[50],
                      border: Border.all(color: Colors.green, width: 3)),
                  child: const Icon(Icons.person),
                ),
                title: const Text(
                  "Manish sahu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Today, 12:20 PM"),
              );
            }
          }),
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Contect()));
        },
        backgroundColor: const Color(0xff01937c),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
        child: const Icon(Icons.message),
      ),
      body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PersonChatPage()));
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
