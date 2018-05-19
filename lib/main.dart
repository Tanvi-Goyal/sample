import 'package:flutter/material.dart';
import 'package:sample/settings.dart';
import 'package:sample/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {

  String _title = 'Please Login';
  Widget _screen;
  login _login;
  settings _settings;
  bool _authenticated;

  MyAppState() {
    _settings = new settings();
    _screen = _login;
    _login = new login(onSubmit: (){onSubmit();},);
    _authenticated = false;
  }

void onSubmit() {
  print('Logged in with: ' + _login.username + '  ' + _login.password);
  if(_login.username == 'user' && _login.password == '    ')
  setAuthenticated(true);
}

void goHome() {
  print("Go Home... $_authenticated");
  setState(() {
      if(_authenticated == true){
        _screen = _settings;
      }
      else {
        _screen = _login;
        _title = 'Please Login';
      }
    });
}

void logOut() {
  print("Loged Out...");
  setAuthenticated(false);
}

void setAuthenticated(bool auth) {
  setState(() {
      if(auth == true){
        _screen = _settings;
        _title = 'Welcome,  ' + _login.username;
      }
      else {
        _screen = _login;
        _title = 'Please Login';
      }
    });
}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: (){goHome();}),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){logOut();})
          ],
        ),
        body: _screen,
      ),
    );
  }
}