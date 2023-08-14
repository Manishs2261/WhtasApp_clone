import 'package:flutter/material.dart';
import 'package:whatsappclone/src/view/home/person_chat_page.dart';

import 'contact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String>title = <String>['Chats', 'Status', 'Calls'];

  @override
  Widget build(BuildContext context) {
    int tabCount = 4;

    return DefaultTabController(
        initialIndex: 1,
        length: tabCount,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              "WhatsApp", style: TextStyle(fontSize: 22, color: Colors.white,letterSpacing: 1),),
            elevation: 1,
            actions: [
              IconButton(onPressed: (){},icon:Icon(Icons.camera_alt_outlined,color: Colors.white,),),

              IconButton(onPressed: (){},icon:Icon(Icons.search_outlined,color: Colors.white,),),


              PopupMenuButton<String>(
                color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                  onSelected: (value){
                  print(value);
                  },
                  itemBuilder: (BuildContext context){

                return [
                  PopupMenuItem(child: Text("New group"),
                    value: "New group",
                  ),
                  PopupMenuItem(child: Text("New broadcst"),
                    value: "New broadcst",
                  ),
                  PopupMenuItem(child: Text("Linked devices"),
                    value: "Linked devices",
                  ),
                  PopupMenuItem(child: Text("Starred messages"),
                    value: "Starred messages",
                  ),
                  PopupMenuItem(child: Text("Payments"),
                    value: "Payments",
                  ),
                  PopupMenuItem(child: Text("Settings"),
                    value: "Settings",
                  ),
                ];
              })


            ],

    notificationPredicate: (ScrollNotification notification) {
      return notification.depth == 1;
    },
            bottom: TabBar(
              indicatorWeight: 3,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              splashFactory: NoSplash.splashFactory,
              indicatorColor: Colors.white,

                tabs: <Widget>[
                  Tab(
                    icon: const Icon(Icons.people_alt_outlined,color: Colors.white,),

                  ),
            Tab(

             child: Text("Chats",style: TextStyle(color: Colors.white),),

          ),
          Tab(

            child: Text("Status",style: TextStyle(color: Colors.white),),
          ),
          Tab(

            child: Text("Calls",style: TextStyle(color: Colors.white),),
          )
          ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Contect()));
            },
            child: Icon(Icons.chat),

          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 25,
                  itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text("group"),

                    );
                  }),
              ChatsPage(),
              ListView.builder(
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index){

                    return ListTile(
                      title: Text("Status"),

                    );
                  }),
              ListView.builder(
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index){

                    return ListTile(
                      title: Text("calls"),

                    );
                  }),
            ],
          ),
        ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  const ChatsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index){

          return ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PersonChatPage()));
            },

            leading: CircleAvatar(radius: 25,
            child: Icon(Icons.person_outline,size: 30,),),
            title: Text("chats",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            subtitle: Row(
              children: [
                Icon(Icons.done_all_outlined),
                SizedBox(width: 3,),
                Text("mansih")
              ],
            ),
            trailing: Column(
              children: [
                Text("12/12/1001"),
                 Icon(Icons.add),

              ],
            ),


          );

        });
  }
}