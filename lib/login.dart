import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class login extends StatelessWidget {
  const login({
    Key key,
    @required this.onSubmit
  }) : super(key: key);
  
  @override
  final VoidCallback onSubmit;
  static final TextEditingController user = new TextEditingController();
  static final TextEditingController pass = new TextEditingController();

  String get username => user.text;
  String get password => pass.text;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TextField(controller: user, decoration: new InputDecoration(hintText: "Enter Username",),),
        new TextField(controller: pass, decoration: new InputDecoration(hintText: "Enter Password",), obscureText: true,),
        new RaisedButton(child: new Text('Log-In'), onPressed: onSubmit,)
      ],
    );
  }

}