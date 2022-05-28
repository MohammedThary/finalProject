import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AnnoucementList.dart';
import 'AnnouncementAdd.dart';
import 'FavoriteAnnoucement.dart';
import 'Login.dart';
import 'UserProfile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnnouncementAdd()));
                  }),
              IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserProfile()));
                  })
            ],
            title: Text('Announcements App'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Annoucement List",
                ),
                Tab(
                  text: "Favorite Annoucement",
                ),
              ],
              isScrollable: true,
            ),
          ),
          body:
              TabBarView(children: [AnnoucementList(), FavoriteAnnoucement()]),
        ));
  }
}
