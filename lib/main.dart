import 'package:flutter/material.dart';
import 'package:login2/ApiServices.dart';
import 'package:login2/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginModel login = null;

  void saveData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (login != null) {
        prefs.setString('key', login.key);

        prefs.setString('id', login.id);
      }
    } catch (e) {
      print("error");
    }
  }

  Future<String> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("id");
  }

  Future<String> getKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("key") ?? "No Name";
  }

  var id;
  var key;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Login"),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text((login != null) ? login.nama : "tidak ada data"),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    ApiServices.connectToApi(
                            "wbudhysantika@gmail.com", "1234567")
                        .then((value) {
                      login = value;

                      setState(() {});
                    });

                    saveData();
                  },
                ),
                RaisedButton(
                    child: Text("Get Transporter Driver"),
                    onPressed: () {
                      ApiServices2.connectToApi(login.id, login.key);
                      // getId().then((value) {
                      //   id = value;
                      // });
                      // print(id);
                    }),
                RaisedButton(
                    child: Text("Get Transporter Driver With Driver"),
                    onPressed: () {
                      ApiServices3.connectToApi(login.id, login.key, login.id);
                      // getId().then((value) {
                      //   id = value;
                      // });
                      // print(id);
                    })
              ],
            ))));
  }
}
