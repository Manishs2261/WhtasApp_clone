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
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select contact",style: TextStyle(color: Colors.white),),
            Text("150 contact",style: TextStyle(fontSize: 13,color: Colors.white),),
      
          ],
        ),
        actions: [

          Icon(Icons.search_outlined,size: 30,color: Colors.white,),
         PopupMenuButton(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
             itemBuilder:(BuildContext context){
           return [
             PopupMenuItem(child: Text("Invite a friend"),value: "Invite a friend",),
             PopupMenuItem(child: Text("Contacts"),value: "Contects",),
             PopupMenuItem(child: Text("Refresh"),value: "Refresh",),
             PopupMenuItem(child: Text("Help"),value: "Help",),
           ];
         })
        ],
        

      ),
      
      body:   ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 25,
          itemBuilder: (BuildContext context, int index){
            if(index == 0)
              {
                return ListTile(title: Text("New group"),leading: CircleAvatar(child: Icon(Icons.group),),);
              }
            else if(index == 1){
              return ListTile(title: Text("New contect"),leading: CircleAvatar(child: Icon(Icons.person_add),),trailing: Icon(Icons.qr_code),);
            }else if( index == 2)
              {
                return ListTile(title: Text("New community"),leading: CircleAvatar(child: Icon(Icons.group),),);
              }else if(index == 3)
                {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                    child: Text("Contacts on WhatsApp",style: TextStyle(color: Colors.grey),),
                  );
                }
            return ListTile(
              leading: CircleAvatar(),
              subtitle: Text("tag line "),
              title: Text("mansih"),
            );
          }),
      );

  }
}
