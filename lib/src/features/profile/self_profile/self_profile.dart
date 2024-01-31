import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsappclone/src/core/res/apis/apis.dart';

import '../../../../main.dart';

class SelfProfile extends StatefulWidget {
  const SelfProfile({super.key});

  @override
  State<SelfProfile> createState() => _SelfProfileState();
}

class _SelfProfileState extends State<SelfProfile> {
  final _formKey = GlobalKey<FormState>();
  String? _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppApis.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              _image != null
                  ? Align(
                      heightFactor: 1.2,
                      alignment: Alignment.center,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          clipBehavior: Clip.antiAlias,
                          child: Image.file(
                            File(_image!),
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          )),
                    )
                  : Align(
                      heightFactor: 1.2,
                      alignment: Alignment.center,
                      child: ClipRRect(
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
              Positioned(
                bottom: 15,
                right: 140,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        useSafeArea: true,
                        builder: (_) {
                          return ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: mq.height * .03, bottom: mq.height * .05),
                            children: [
                              Text(
                                'Pick profile Picture',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        final ImagePicker _picker = ImagePicker();
                                        // Pick an image
                                        final XFile? image =
                                            await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
                                        if (image != null) {
                                          log('Image Path: ${image.path}');
                                          setState(() {
                                            _image = image.path;
                                          });

                                           AppApis.updateProfilePicture(File(_image!));
                                          // for hiding bottom sheet
                                          Navigator.pop(context);
                                        }
                                      },
                                      icon: Icon(
                                        Icons.photo_album_outlined,
                                        size: 50,
                                      )),
                                  IconButton(
                                      onPressed: () async {
                                        final ImagePicker _picker = ImagePicker();
                                        // Pick an image
                                        final XFile? image =
                                            await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);
                                        if (image != null) {
                                          setState(() {
                                            _image = image.path;
                                          });
                                        }
                                        AppApis.updateProfilePicture(File(_image!));
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        size: 50,
                                      )),
                                ],
                              )
                            ],
                          );
                        });
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Form(
                          key: _formKey,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 80, left: 20, right: 20, top: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Enter your name",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  initialValue: AppApis.me.name,
                                  maxLines: 1,
                                  autofocus: true,
                                  maxLength: 24,
                                  onSaved: (val) => AppApis.me.name = val ?? '',
                                  validator: (val) => val != null && val.isNotEmpty ? null : "Required Field",
                                  onTapOutside: (e) => FocusScope.of(context).unfocus(),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(hintText: 'Enter your name'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Close the bottom sheet
                                      },
                                      child: Text('Close'),
                                    ),
                                    SizedBox(width: 8),
                                    TextButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          print("save");
                                          _formKey.currentState!.save();
                                          AppApis.updateUserInfo();
                                        }
                                      },
                                      child: Text('Save'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${AppApis.me.name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  leading: Icon(
                    Icons.person_2_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                  trailing: Icon(
                    Icons.edit_outlined,
                    color: Colors.green,
                  ),
                  subtitle: Text("This in not your username or pin. This name will be visible to your"
                      " WhatsApp contacts. "),
                  isThreeLine: true,
                  dense: true,
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${AppApis.me.about}",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  leading: Icon(
                    Icons.info_outline,
                    size: 30,
                    color: Colors.grey,
                  ),
                  trailing: Icon(
                    Icons.edit_outlined,
                    color: Colors.green,
                  ),
                  dense: true,
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "${AppApis.me.email}",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                  leading: Icon(
                    Icons.email_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                  dense: true,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
