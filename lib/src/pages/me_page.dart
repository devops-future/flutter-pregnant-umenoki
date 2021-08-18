///
/// Project name : Umenoki
/// Description : Me page
/// Author : Xiao
/// Date : 2020-06-02
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umenoki/src/services/auth.dart';

class MePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _MePageState();
}

class _MePageState extends State<MePage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          color: Colors.blue,
          child: Text('Log Out',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            )
          ),
          onPressed: () {
            Auth().signOut().then((value){
              Navigator.pushReplacementNamed(context, '/auth/login');
            });
          },
        ),
    );
  }
}