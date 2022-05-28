import 'package:final_project4/Model/User.dart';
import 'package:final_project4/UI/signup.dart';
import 'package:final_project4/constants.dart';
import 'package:final_project4/main.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import 'HomePage.dart';

GlobalKey<FormState> _LoginFormKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login_page(),
    );
  }
}

class Login_page extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey();

  String email = "";
  String password = "";
  Log_in_method(BuildContext context) {
    if (_LoginFormKey.currentState!.validate()) {
      _LoginFormKey.currentState!.save();
      for (int i = 0; i < users_list.length; i++) {
        String em = users_list.elementAt(i).email;
        String pass = users_list.elementAt(i).password;
        if (em == email) {
          if (pass == password) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => TabBarPage()));
          } else {
            scaffoldKey1.currentState!.showSnackBar(SnackBar(
              content: Text('wrong password'),
            ));
          }
        } else {
          scaffoldKey1.currentState!.showSnackBar(SnackBar(
            content: Text('wrong Email'),
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey1,
      appBar: AppBar(
        title: Text("Log in"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _LoginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                onSaved: (newValue) {
                  this.email = newValue!;
                },
                validator: (value) {
                  if (value == null || value == "") {
                    return 'required field';
                  } else if (!isEmail(value)) {
                    return 'wrong email syntax';
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              TextFormField(
                onSaved: (newValue) {
                  this.password = newValue!;
                },
                validator: (value) {
                  if (value == null || value == "") {
                    return 'required field';
                  }
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              Container(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text('Log in'),
                    onPressed: () {
                      Log_in_method(context);
                    }),
              ),
              Container(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                    color: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text('Sign in'),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => signup()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
