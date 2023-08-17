import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/foundation.dart' as foundation;
import 'package:whatsappclone/src/view/home/profile.dart';

import 'Home.dart';

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

       automaticallyImplyLeading: false,

        title:InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(context)=> ProfilePage(),maintainState: false));
          },
          child: Row(
            children: [
               InkWell(child: Icon(Icons.arrow_back),onTap: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                 },),
              SizedBox(width: 5,),
              CircleAvatar(child: Icon(Icons.person_outline),),
              SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Manish"),
                SizedBox(height: 2,),
                Text("Online",style: TextStyle(fontSize: 12,color: Colors.white70),)
              ],
            )
            ],
          ),
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

            Container(
              height: MediaQuery.of(context).size.height - 140,
              child: ListView(
                shrinkWrap: true,
                children: [
                  OwnMessageCard(),
                  ReplyCard(),
                  OwnMessageCard(),
                  ReplyCard(),
                  OwnMessageCard(),
                  ReplyCard(),
                  OwnMessageCard(),
                  ReplyCard(),
                  OwnMessageCard(),
                  ReplyCard(),
                  OwnMessageCard(),
                  ReplyCard(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
             child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width -60,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 100,
                            minLines: 1,
                            decoration: InputDecoration(

                              border: InputBorder.none,

                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                InkWell(
                                  onTap: (){
                                    showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                        context: context, builder: (builder)=> bottomSheet());
                                  },
                                    child: Icon(Icons.attach_file)),
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
                        padding: const EdgeInsets.only(left: 2,right: 3,bottom: 8),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff01937c),
                          radius: 25,
                          child: Icon(Icons.send,color: Colors.white,),),
                      )
                    ],
                  ),

            ),

          ],
        ),
      ),

    );
  }

  //===========bottom sheet ====================
Widget bottomSheet(){
    return Container(

      height: 360,
      width: MediaQuery.of(context).size.width - 10,
      child: Card(
          margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  buttomSheetIcon(Icons.insert_drive_file,Colors.indigo,"Document"),
                  SizedBox(width: 40,),
                  buttomSheetIcon(Icons.camera_alt,Colors.pink,"Camera"),
                  SizedBox(width: 40,),
                  buttomSheetIcon(Icons.photo,Colors.purpleAccent,"Gallery"),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  buttomSheetIcon(Icons.audio_file,Colors.orangeAccent,"Audio"),
                  SizedBox(width: 40,),
                  buttomSheetIcon(Icons.location_on,Colors.green,"Location"),
                  SizedBox(width: 40,),
                  buttomSheetIcon(Icons.currency_rupee_outlined,Colors.lightGreen,"Payment"),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  buttomSheetIcon(Icons.person,Colors.blueAccent,"Contact"),
                  SizedBox(width: 40,),
                  buttomSheetIcon(Icons.poll_outlined,Colors.grey,"Poll"),

                ],
              ),

            ],
          ),
        ),

      ),
    );
}

Widget buttomSheetIcon(IconData icon,Color color,String text){
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon,size: 29,color: Colors.white,),
          ),
          SizedBox(height: 5,),
          Text(text,style: TextStyle(fontSize: 12),)
        ],
      ),
    );
}

//======================================

}


class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xffd5ffd0),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 80,top: 5,bottom: 20),
                child: Text("Hey i am using WhatsApp",style: TextStyle(fontSize: 16),),
              ),
              Positioned(
                right: 4,
                bottom: 4,
                child: Row(
                  children: [
                    Text("23:21 pm",style: TextStyle(fontSize: 12,color: Colors.grey),),
                    Icon(Icons.done_all_outlined,size: 15,color: Colors.blue,),
                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}

class ReplyCard extends StatelessWidget {
  const ReplyCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xfff3fde8),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 80,top: 5,bottom: 20),
                child: Text("Hey",style: TextStyle(fontSize: 16),),
              ),
              Positioned(
                right: 4,
                bottom: 4,
                child: Text("23:21 pm",style: TextStyle(fontSize: 12,color: Colors.grey),),



              )
            ],
          ),
        ),

      ),
    );
  }
}
