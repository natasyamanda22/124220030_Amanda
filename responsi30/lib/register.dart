// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:responsi30/home_page.dart';
import 'package:responsi30/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

abstract class _RegisterPageState extends State<_RegisterPageState> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmpasswordController = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;
  @override
  void iniState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _konfirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login Form",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _konfirmpasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'konfirmpassword',
                  ),
                ),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                OnPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  String konfirmpassword = _konfirmpasswordController.text;
                  if (username != "&& password !=") {
                    print('Successfull');
                    logindata.setBool('login.false');
                    logindata.setString(username, username);
                    Navigator.push(context,
                        MaterialPageRouter(builder: (context) => HomePage()));
                  }
                },
                Child: Text("Login"),
              )
            ],
          ),
        ));
  }
}
