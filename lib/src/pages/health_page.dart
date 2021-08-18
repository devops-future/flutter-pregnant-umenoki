///
/// Project name : Umenoki
/// Description : Health page
/// Author : Xiao
/// Date : 2020-06-02
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _HealthPageState();
}

class _HealthPageState extends State<HealthPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Health page'),
      )
    );
  }
}