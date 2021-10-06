import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_diary/bindings/bindings.dart';
import 'package:tomorrow_diary/controllers/controllers.dart';
import 'package:tomorrow_diary/views/views.dart';

class DrawerSideMenu extends StatelessWidget {
  UserController uc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(children: [
          IconButton(onPressed: (){
            Get.to(GalleryScreen());
          }, icon: Icon(Icons.camera_alt)),
          Card(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                uc.logout();
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('MyPage'),
              onTap: () {
                Get.to(() => MyPageScreen());
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(CupertinoIcons.book),
              title: Text('Open Source'),
              onTap: () {
                Get.to(() => OpenSourceScreen());
              },
            ),
          ),
        ]),
      ),
    );
  }
}
