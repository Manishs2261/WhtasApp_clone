import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              height: 310,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 5,
                    blurStyle: BlurStyle.outer

                  )
                ],
                color: Colors.white,

              ),
              child:   Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Icon(Icons.arrow_back), CircleAvatar(child: CircleAvatar(radius: 60,),radius: 65,backgroundColor: Colors.grey,),
                      PopupMenuButton<String>(

                          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                          onSelected: (value){
                            print(value);
                          },
                          itemBuilder: (BuildContext context){
                            return  [
                              PopupMenuItem(
                                child: Text("Share"),
                                value: "Share",),
                              PopupMenuItem(child: Text("Edit"),value: "Edit",),
                              PopupMenuItem(child: Text("View in address book"),value: "View in address book",),
                              PopupMenuItem(child: Text("Verify security code"),value: "Verify security code",)

                            ];

                          })
                    ],
                  ),
                  Text("Manish sahu",style: TextStyle(fontSize: 30),),
                  Text("+91 9023562145",style: TextStyle(color: Colors.grey,fontSize: 18),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReuseRow(icon: Icons.call, name: "Audio"),
                      SizedBox(width: 15,),
                      ReuseRow(icon: Icons.video_call, name: "Video"),
                      SizedBox(width: 15,),
                      ReuseRow(icon: Icons.currency_rupee_outlined, name: "Pay"),
                      SizedBox(width: 15,),
                      ReuseRow(icon: Icons.search_outlined, name: "Search"),
                    ],
                  )

                ],
              )

            ),
            SizedBox(height: 10,),
            Container(
              height: 70,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,

                      blurRadius: 5,
                      offset: Offset(2, 2),
                      blurStyle: BlurStyle.outer

                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Success and excuess do not talk together",style: TextStyle(fontSize: 18),),
                    Text("21 August 2021",style: TextStyle(color:Colors.grey),)

                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Media,links,and docs",style: TextStyle(fontSize: 18),),
                    Row(
                      children: [
                        Text("75",style: TextStyle(color: Colors.grey),),
                        Icon(Icons.arrow_forward_ios,color: Colors.grey,)
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,

                        blurRadius: 5,
                        offset: Offset(2, 2),
                        blurStyle: BlurStyle.outer

                    )
                  ]
              ),
            ),
  SizedBox(height: 10,),
            Container(
              child: Column(
                children: [
                  ListTile(leading: Icon(Icons.notifications,color: Colors.grey,),
                    title: Text("Mute notification"),
                    trailing: Icon(Icons.toggle_off_outlined,size: 40,color: Colors.grey,),),
                  ListTile(leading: Icon(Icons.music_note,color: Colors.grey,),
                    title: Text("Custom notification"),
                  ),
                  ListTile(leading: Icon(Icons.photo,color: Colors.grey,),
                    title: Text("Media visibility"),
                    ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,

                      blurRadius: 5,
                      offset: Offset(2, 2),
                      blurStyle: BlurStyle.outer

                  )
                ]
              ),
            ),

            SizedBox(height: 10,),
            Container(
              child: Column(
                children: [
                  ListTile(leading: Icon(Icons.lock,color: Colors.grey,),
                  title: Text("Encryption"),
                  subtitle: Text("Messages and calls are end-to-end encrypted Tap to verify"),),
                  ListTile(leading: Icon(Icons.access_time_outlined,color: Colors.grey,),title: Text("Disppering message"),subtitle: Text("off"),),
                  ListTile(leading: Icon(Icons.lock_clock_rounded,color: Colors.grey,),title: Text("Chat lock"),),


                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,

                        blurRadius: 5,
                        offset: Offset(2, 2),
                        blurStyle: BlurStyle.outer

                    )
                  ]
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 10,left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("8 Group in common"),
                  SizedBox(height: 10,),
                  ListTile(leading: CircleAvatar(child: Icon(Icons.group,color: Colors.white,),),
                    title: Text("Create group with Manish"),)
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,

                        blurRadius: 5,
                        offset: Offset(2, 2),
                        blurStyle: BlurStyle.outer

                    )
                  ]
              ),
            ),
            Container(
              child: Column(
                children: [
                  ListTile(leading: Icon(Icons.block,color: Colors.red,),title: Text("Block Mansih sahu"),),
                  ListTile(leading: Icon(Icons.thumb_down,color: Colors.red,),title: Text("Report Mansih sahu"),),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,

                        blurRadius: 5,
                        offset: Offset(2, 2),
                        blurStyle: BlurStyle.outer

                    )
                  ]
              ),
            ),
            SizedBox(height: 50,)

          ],
        ),
      ),
    );
  }
}

class ReuseRow extends StatelessWidget {
   IconData icon;
   String name;
   ReuseRow({required this.icon,required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Icon(icon,color: Colors.green,),
          SizedBox(height: 5,),
          Text(name,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),

        ],
      )
    ;
  }
}

