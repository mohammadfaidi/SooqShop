import 'dart:io';
import 'dart:ui';

import 'package:eshop2/providers/items_provider.dart';
import 'package:eshop2/providers/language.dart';
import 'package:eshop2/screens/lanuages.dart';
import 'package:eshop2/screens/login.dart';
import 'package:eshop2/screens/settings.dart';
import 'package:eshop2/widgets/aboutscreen.dart';
import 'package:eshop2/widgets/cloud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

//import 'package:path/path.dart';

class MyDrawer extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyDrawer> {
  bool abdSwitch = false;
  Language _language = Language();
  final auth = FirebaseAuth.instance;
  File file;

  UploadTask uploadTask;
  String url =
      "https://cdn.dribbble.com/users/2512810/screenshots/14954503/media/698f24aeaa2d8d421758be99bd4a6211.jpg?compress=1&resize=400x300";

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogIn(),
        ));
  }

  @override
  void initState() {
    super.initState();
    setState(() => _language.getLanguage());
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? 'Select File' : 'No File Selected !!';
    TasksProvider abdProvider = Provider.of<TasksProvider>(context);

    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      //  radius: 100.0,
                      // backgroundImage: AssetImage(
                      //  "images/moh.jpg",
                      //),
                      backgroundImage: NetworkImage(
                        "${url}",
                      ),
                      //backgroundColor: abdSwitch ? Colors.white : Colors.red,
                      backgroundColor: Colors.red,
                      minRadius: 50,
                      maxRadius: 75,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${_language.tSooq()}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 2,
                    color: Colors.grey,
                    // margin: EdgeInsets.all(12),
                  ),
                ],
              ),
              //List("Dark Mode")
              Column(
                children: [
                  ListTile(
                    title: Text("${_language.tUpload()}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600)),
                    // trailing: ,
                    leading: Icon(
                      Icons.upload_file,
                      color: Colors.red,
                    ),
                    onTap: () {
                      print("1");
                      sllected().then((value) => value = uplodFile());
                    },
                  ),
                  ListTile(
                    title: Text("${_language.tDrkkMode()}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600)),
                    // trailing: ,
                    leading: Icon(
                      Icons.night_shelter,
                      color: Colors.red,
                    ),
                    trailing: Switch(
                      value: abdSwitch,
                      onChanged: (value) {
                        setState(() {
                          if (abdSwitch = value) {
                            value = abdProvider.setTheme(ThemeData(
                              backgroundColor: Colors.black,
                              accentColor: Colors.black,
                              scaffoldBackgroundColor: Colors.black,
                              colorScheme: ColorScheme.dark(),
                              primaryColor: Colors.black,
                              primaryColorDark: Colors.black,
                              switchTheme: SwitchThemeData(
                                  thumbColor: MaterialStateProperty.all(
                                    Colors.black,
                                  ),
                                  trackColor: MaterialStateProperty.all(
                                    Colors.red,
                                  )),
                            ));
                          } else {
                            value = abdProvider.setTheme(ThemeData(
                              scaffoldBackgroundColor: Colors.white,
                              primaryColor: Colors.red,
                              colorScheme: ColorScheme.light(),
                              switchTheme: SwitchThemeData(
                                thumbColor:
                                    MaterialStateProperty.all(Colors.white),
                                trackColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                            ));
                          }
                        });
                      },
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text("${_language.tLanguage()}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600)),
                    leading: Icon(
                      Icons.language,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguageDrawer(),
                          ));
                    },
                  ),
                  ListTile(
                    title: Text("${_language.tAbout()}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600)),
                    leading: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => About(),
                          ));
                    },
                  ),
                  ListTile(
                    title: Text("${_language.tSetting()}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600)),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Setting(),
                          ));

                      //Setting(),
                    },
                  ),
                  ListTile(
                    title: Text("${_language.tLogOut()}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w600)),
                    leading: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    onTap: () {
                      logout();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sllected() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      return;
    }
    final path = result.files.single.path;

    setState(() {
      file = File(path);
    });
  }

  Future<void> uplodFile() async {
    if (file == null) return null;
    final filename = file.path;
    final path = 'images/$filename';
    uploadTask = CloudStorage.uploadFile(path, file);
    if (uploadTask == null) return;
    final snapShot = await uploadTask.whenComplete(() {});
    final urlDownlod = await snapShot.ref.getDownloadURL();
    setState(() {
      url = urlDownlod;
    });
  }
}
