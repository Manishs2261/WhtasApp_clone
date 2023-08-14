import 'package:flutter/material.dart';

class PersonChatPage extends StatefulWidget {
  const PersonChatPage({super.key});

  @override
  State<PersonChatPage> createState() => _PersonChatPageState();
}

class _PersonChatPageState extends State<PersonChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,


        title:Row(
          children: [
            CircleAvatar(child: Icon(Icons.person_outline),),
            SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Manish"),
              Text("last seen today at 12.22",style: TextStyle(fontSize: 10),)
            ],
          )
          ],
        ),

        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call)),
          PopupMenuButton(
              
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              itemBuilder: (BuildContext context){
            
            return [
              PopupMenuItem(child: Text("View contact"),value: "View context",),
              PopupMenuItem(child: Text("Media,links,and docs"),value: "Media ,links, and docs",),
              PopupMenuItem(child: Text("Search"),value: "Searsh",),
               
              PopupMenuItem(child: Text("Mute notification"),value: "Mute notification",),
              PopupMenuItem(child: Text("Disappearing messages"),value: "Disappearring messages",),
              PopupMenuItem(child: Text("Wallpaper"),value: "Wallpaper",),
              PopupMenuItem(child: Text("More"),value: "More",),
            ];
          })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,

              child:   Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width -55,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 100,
                        minLines: 1,
                        decoration: InputDecoration(
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                            Icon(Icons.attach_file),
                              SizedBox(width:10,),
                               Icon(Icons.currency_rupee_outlined),
                              SizedBox(width:10,),
                              Icon(Icons.camera_alt_outlined),
                              SizedBox(width:10,)
                            ],
                          ),
                          hintText: "Type a Message",
                          contentPadding: EdgeInsets.all(8),
                          prefixIcon: IconButton(icon: Icon(Icons.emoji_emotions_outlined),onPressed: (){},)
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2,right: 2,bottom: 8),
                    child: CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.send),),
                  )
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
