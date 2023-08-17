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
          //  backgroundColor: Colors.green,
            title: Text("WhatsApp", style: TextStyle(fontSize: 22, color: Colors.white,letterSpacing: 1),),
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
                    icon: const Icon(Icons.people_alt_outlined,),

                  ),
            Tab(

             child:  Row(
               children: [
                 Text("Chats",style: TextStyle(fontSize: 15),),
                 SizedBox(width: 5,),
                 CircleAvatar(
                   backgroundColor: Colors.white,child: Text("9",style: TextStyle(fontSize: 10),),radius: 8,)
               ],
             )

          ),
          Tab(

            child: Row(
              children: [
                Text("Status",style: TextStyle(fontSize: 15),),
                SizedBox(width: 5,),
                CircleAvatar(radius: 3,backgroundColor: Colors.white70,)
              ],
            )

          ),
          Tab(

            child:  Row(
              children: [
                Text("Calls",style: TextStyle(fontSize: 15),),
                SizedBox(width: 5,),
                CircleAvatar(radius: 3,backgroundColor: Colors.white70,)
              ],
            )
          )
          ],
            ),
          ),
         
          body: TabBarView(
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
    );
  }
}

class GroupPage extends StatelessWidget {
  const GroupPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
        itemBuilder: (BuildContext context, int index){
        return Container(
          height: 80,
          child: Card(

            child: ListTile(
              leading: Stack(

                children: [
                  Container(
                    height: 48,
                    width: 48,
                    child: Icon(Icons.group,color: Colors.white,),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.all(Radius.elliptical(15, 15))
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 24,
                    child: Container(
                      height: 25,
                      width: 25,
                      child: Icon(Icons.add,color: Colors.white,),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white)

                      ),
                    ),
                  )
                ],
              ),
              title: Text("New community",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

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
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Contect()));
        },
        child: Icon(Icons.add_ic_call_rounded,),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
      ),
      body: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index){

            if(index == 0)
              {
                return ListTile(
                  title: Text("Create call link",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  subtitle: Text("Share a link your WhatsApp call"),
                  leading: CircleAvatar(radius: 25,child: Icon(Icons.link),),

                );

              }else if(index == 1)
                {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
                    child: Text("Recent",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 15),),
                  );

                }else
                  {
                    return ListTile(
                      title: Text("Create call link",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      subtitle: Row(
                        children: [
                          Icon(Icons.call_received_outlined,color: Colors.red,),
                          SizedBox(width: 5,),
                          Text("Yesterday 3:04 pm"),
                        ],
                      ),
                      leading: CircleAvatar(radius: 25,child: Icon(Icons.link),),
                      trailing: Icon(Icons.call,color: Colors.green,),

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
      floatingActionButton:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: FloatingActionButton(
              onPressed: (){},

              backgroundColor: Colors.green.shade50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
              child: Icon(Icons.edit,color: Colors.green,),
            ),
          ),
          SizedBox(height: 30,),
          FloatingActionButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
            child: Icon(Icons.camera_alt,),
          ),

        ],
      ),


      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context, int index){

            if(index == 0)
              {
                return ListTile(
                  leading: Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red,
                          border: Border.all(color: Colors.green,width: 3)
                        ),
                      ),
                      Positioned(
                        top: 22,
                        left: 22,
                        child: Container(

                          child: Icon(Icons.add,color: Colors.white,),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border:  Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(100),

                          ),
                        ),
                      )
                    ],
                  ),
                  title: Text("My status",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  subtitle: Text("Tap to add status update"),
                  trailing: Icon(Icons.more_vert,color: Colors.green,),

                );

              }else if(index == 1)
                {

                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                   child: Text("Recent updates",),
                 );

                }else if(index < 6)
                  {
                    return ListTile(
                      leading:    Container(
                        height: 50,
                        width: 50,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.red,
                            border: Border.all(color: Colors.green,width: 3)
                        ),
                      ),
                      title: Text("Manish sahu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      subtitle: Text("Today, 12:20 PM"),

                    );
                  }else if(index == 6)
                    {
                     return Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                       child: Text("Viewed updates"),
                     );
                    }else
                      {
                        return ListTile(
                          leading:    Container(
                            height: 50,
                            width: 50,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.red,
                                border: Border.all(color: Colors.green,width: 3)
                            ),
                          ),
                          title: Text("Manish sahu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          subtitle: Text("Today, 12:20 PM"),

                        );

                      }






             ;
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
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Contect()));
        },
        child: Icon(Icons.message),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(15, 15))),
      ),
      body: ListView.builder(
          itemCount: 10,

          itemBuilder: (BuildContext context, int index){

            return   ListTile(
                            onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PersonChatPage()));
                            },

                            leading: CircleAvatar(radius: 25,
                            child: Icon(Icons.person_outline,size: 30,),),
                            title: Text("Manish SAhu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            subtitle: Row(
                            children: [
                            Icon(Icons.done_all_outlined,size: 18,color: Colors.blue,),
                            SizedBox(width: 3,),
                            Flexible(child: Text("Hello i am manish sshu  ",overflow: TextOverflow.ellipsis,maxLines: 1,softWrap: false,))
                            ],
                            ),
                            trailing: Column(
                            children: [
                            Text("12/12/1001",style: TextStyle(fontSize: 12,color: Colors.green),),
                            SizedBox(height: 5,),
                            CircleAvatar(radius: 12,backgroundColor: Colors.green,child: Text("55",style: TextStyle(fontSize: 12,color: Colors.white),),),

                            ],
                            ),


                            );

          }),
    );
  }
}


