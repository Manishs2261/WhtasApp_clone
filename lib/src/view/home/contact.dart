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

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select contact",style: TextStyle(color: Colors.white),),
            SizedBox(height: 3,),
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
                return ListTile(title: Text("New group",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),leading: CircleAvatar(child: Icon(Icons.group),backgroundColor: Colors.red[100],),);
              }
            else if(index == 1){
              return ListTile(title: Text("New contect",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),leading: CircleAvatar(backgroundColor: Colors.red[100],child: Icon(Icons.person_add),),trailing: Icon(Icons.qr_code,color: Colors.green,),);
            }else if( index == 2)
              {
                return ListTile(title: Text("New community",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),leading: CircleAvatar(backgroundColor: Colors.red[100],child: Icon(Icons.group),),);
              }else if(index == 3)
                {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                    child: Text("Contacts on WhatsApp",style: TextStyle(color: Colors.black54),),
                  );
                }
            return ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),backgroundColor: Colors.blue[100],),
              subtitle: Text("tag line "),
              title: Text("Mansih sahu",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            );
          }),
      );

  }
}
