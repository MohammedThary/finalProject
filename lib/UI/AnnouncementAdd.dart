import 'package:final_project4/Model/Announcement.dart';
import 'package:final_project4/UI/Login.dart';
import 'package:final_project4/constants.dart';
import 'package:final_project4/main.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

GlobalKey<FormState> _addAnnFormKey = GlobalKey<FormState>();

class AnnouncementAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnouncementAdd_page(),
    );
  }
}

class AnnouncementAdd_page extends StatelessWidget {
  String id = "";
  String image = "";
  String title = "";
  double price = 0;
  String description = "";
  String location = "";
  String user_id = "";
  Add_announcment(BuildContext context) {
    if (_addAnnFormKey.currentState!.validate()) {
      _addAnnFormKey.currentState!.save();

      announcements_list.add(Announcement(
          id, image, title, price, description, location, 0, user_id));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TabBarPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Announcment"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _addAnnFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      onSaved: (newValue) {
                        this.title = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value == "") {
                          return 'required field';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'title',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      onSaved: (newValue) {
                        this.price = double.parse(newValue!);
                      },
                      validator: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (value == null || value == "") {
                          return 'required field';
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'price',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      onSaved: (newValue) {
                        this.description = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value == "") {
                          return 'required field';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      onSaved: (newValue) {
                        this.location = newValue!;
                      },
                      validator: (value) {
                        if (value == null || value == "") {
                          return 'required field';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Location',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    height: 60,
                    child: RaisedButton(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text('Add'),
                        onPressed: () {
                          Add_announcment(context);
                        }),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    height: 60,
                    child: RaisedButton(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text('Home'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TabBarPage()));
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
