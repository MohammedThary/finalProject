import 'package:final_project4/Model/User.dart';
import 'package:final_project4/UI/Login.dart';
import 'package:final_project4/constants.dart';
import 'package:final_project4/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

GlobalKey<FormState> _sigInFormKey = GlobalKey<FormState>();

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signup_page(),
    );
  }
}

class signup_page extends StatelessWidget {
  bool cheakemail = false;
  String id = "";
  String name = "";
  String email = "";
  int phone = 0;
  String password = "";
  saveForm(BuildContext context) {
    if (_sigInFormKey.currentState!.validate()) {
      _sigInFormKey.currentState!.save();
      if (cheakemail) {
        users_list.add(new User(id, name, email, phone, password));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    }
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _sigInFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                onSaved: (newValue) {
                  this.name = newValue!;
                },
                validator: (value) {
                  if (value == null || value == "") {
                    return 'required field';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Full name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
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

                  for (int i = 0; i < users_list.length; i++) {
                    String em = users_list.elementAt(i).email;
                    if (em == value) {
                      scaffoldKey.currentState!.showSnackBar(SnackBar(
                        content: Text('email is already exist'),
                      ));
                    } else if (em != value && i == users_list.length - 1) {
                      cheakemail = true;
                    }
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
                  } else if (value.length <= 6) {
                    return 'short password';
                  }
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              TextFormField(
                onSaved: (newValue) {
                  this.phone = int.parse(newValue!);
                },
                validator: (value) {
                  if (value == null || value == "") {
                    return 'required field';
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'phone number',
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
                    child: Text('Submit'),
                    onPressed: () {
                      saveForm(context);
                    }),
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
