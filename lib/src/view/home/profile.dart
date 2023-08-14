import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
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
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Card(
           color: Colors.white,
              child: Column(
                children: [
                  CircleAvatar(radius: 50,)
                ],
              ) ,),
          )
        ],
      ),
    );
  }
}
