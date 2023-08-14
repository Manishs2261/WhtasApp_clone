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
          Icon(Icons.more_vert,size: 30,color: Colors.white,),
          SizedBox(width:15 ),
        ],
        

      ),
      
      body:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Icon(Icons.people_alt_outlined,color: Colors.white,),
            ),
            title: Text("New group"),),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Icon(Icons.people_alt_outlined,color: Colors.white,),
            ),
            trailing: Icon(Icons.qr_code),
            title: Text("New contact"),),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Icon(Icons.people_alt_outlined,color: Colors.white,),
            ),
            title: Text("New community"),),

          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: Text("Contacts on WhatsApp",style: TextStyle(
                color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w700
            ),),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: CircleAvatar(),
                    subtitle: Text("tag line "),
                    title: Text("mansih"),
                  );
                }),
          )

        ],
      ),
      );

  }
}
