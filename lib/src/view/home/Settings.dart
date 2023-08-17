import 'package:flutter/material.dart';

class SettingssPage extends StatelessWidget {
  const SettingssPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListTile(
            leading: CircleAvatar(radius: 25,child: Icon(Icons.person),),
            title: Text("Msnish Sahu",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 19),),
            subtitle: Text("I am the Captain of my life"),
            trailing: Icon(Icons.qr_code,color: Colors.green,),),
            Divider(),
            SettingListTile(title:"Account", subtitle: "Security notifications,change number", icon:Icons.key_sharp),
            SettingListTile(title:"Privacy", subtitle: "Block contacts,disappering message", icon:Icons.lock),
            SettingListTile(title:"Avatar", subtitle: "Create,edit,profile photo", icon:Icons.emoji_emotions),
            SettingListTile(title:"Chats", subtitle: "Theme,wallpapers,chat history", icon:Icons.chat),
            SettingListTile(title:"Notification", subtitle: "Message,group & call tones", icon:Icons.notifications),
            SettingListTile(title:"Storage and data", subtitle: "Network usage, auto-download", icon:Icons.storage),
            SettingListTile(title:"App language", subtitle: "English(Phone language)", icon:Icons.language),
            SettingListTile(title:"Help", subtitle: "Help center,contact us,privacy policy", icon:Icons.help),
            SettingListTile(title:"Invite a friend", icon:Icons.group),

            Text("From"),
            Text("Manish sa",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 40,)




          ],
        ),
      ),

    );
  }
}

class SettingListTile extends StatelessWidget {

  String title;
  String subtitle;
  IconData icon;


   SettingListTile({required this.title,this.subtitle = '',required this.icon,});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 25,),
      title: Text(title,style: TextStyle(fontSize: 16),),
      subtitle: Text(subtitle,),
    );
  }
}
