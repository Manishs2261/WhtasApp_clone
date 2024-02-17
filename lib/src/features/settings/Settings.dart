import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/src/features/profile/self_profile/self_profile.dart';

import '../../core/res/apis/apis.dart';

class SettingssPage extends StatefulWidget {
  const SettingssPage({super.key});

  @override
  State<SettingssPage> createState() => _SettingssPageState();
}

class _SettingssPageState extends State<SettingssPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppApis.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SelfProfile()));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue[100],
                child:  ClipRRect(
                  borderRadius: BorderRadius.circular(360),
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                    imageUrl: AppApis.me.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              title:  Text(
                "${AppApis.me.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              subtitle:  Text(""
                  "${AppApis.me.about}"),
              trailing: const Icon(
                Icons.qr_code,
                color: Colors.green,
              ),
            ),
            const Divider(),
            SettingListTile(
                title: "Account",
                subtitle: "Security notifications,change number",
                icon: Icons.key_sharp),
            SettingListTile(
                title: "Privacy",
                subtitle: "Block contacts,disappering message",
                icon: Icons.lock),
            SettingListTile(
                title: "Avatar",
                subtitle: "Create,edit,profile photo",
                icon: Icons.emoji_emotions),
            SettingListTile(
                title: "Chats",
                subtitle: "Theme,wallpapers,chat history",
                icon: Icons.chat),
            SettingListTile(
                title: "Notification",
                subtitle: "Message,group & call tones",
                icon: Icons.notifications),
            SettingListTile(
                title: "Storage and data",
                subtitle: "Network usage, auto-download",
                icon: Icons.storage),
            SettingListTile(
                title: "App language",
                subtitle: "English(Phone language)",
                icon: Icons.language),
            SettingListTile(
                title: "Help",
                subtitle: "Help center,contact us,privacy policy",
                icon: Icons.help),
            SettingListTile(title: "Invite a friend", icon: Icons.group),
            const Text("From"),
            const Text(
              "Manish sa",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            )
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

  SettingListTile({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
      ),
    );
  }
}
