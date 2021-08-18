///
/// Project name : Umenoki
/// Description : My baby page
/// Author : Xiao
/// Date : 2020-06-02
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umenoki/src/widgets/shape_border_widget.dart';
import 'package:umenoki/src/app_theme.dart';
class MyBabyPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _MyBabyPageState();
}

class _MyBabyPageState extends State<MyBabyPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder(context),
      body: _bodyBuilder(context),
    );
  }

  // app bar widget
  Widget _appBarBuilder(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/components/navigation_title.png'
      ),
      centerTitle: true,
      shape: CustomShapeBorder(),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.settings,
            size: 30.0,
            color: AppTheme.nearlyDarkRed,
          ),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/mybaby/setting');
          },
        ),
      ],
    );
  }

  // body widget
  Widget _bodyBuilder(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage("assets/components/bg_baby.png"),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Image(
          image: AssetImage("assets/components/img_msg_box.png"),
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.4,
          fit: BoxFit.contain,
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4-(MediaQuery.of(context).size.width * 0.5 - 75) * 4 / 3 - 60, left: 40, right: MediaQuery.of(context).size.width * 0.5 + 45, bottom: MediaQuery.of(context).size.height * 0.5 - 30, ),
          child:RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff3C4590),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4-70, left: MediaQuery.of(context).size.width*0.32),
          child:Image(
            image: AssetImage("assets/components/img_baby.png"),
            width: MediaQuery.of(context).size.width*0.35,
            height: MediaQuery.of(context).size.height*0.5 - 150,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 0),
              child:Image(
                image: AssetImage("assets/components/img_baby_bottom.png"),
                width: MediaQuery.of(context).size.width,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
            //your elements here
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              '2 Months 23 Days',
              style: TextStyle(color: Color(0xffFD5562), fontSize: 23, fontFamily: 'Avenir'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Rafinha will see you in ',
                  style: TextStyle(color: Color(0xff3C4590), fontSize: 20, fontFamily: 'Avenir'),
                ),
                Text(
                  '234 Days',
                  style: TextStyle(color: Color(0xffFD5562), fontSize: 23, fontFamily: 'Avenir'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/components/icn_baby_prev.png"),
                  width: 40,
                  height: 25,
                  fit: BoxFit.contain,
                ),
                Image(
                  image: AssetImage("assets/components/icn_baby_play.png"),
                  width: 30,
                  height: 50,
                  fit: BoxFit.contain,
                ),
                Image(
                  image: AssetImage("assets/components/icn_baby_next.png"),
                  width: 40,
                  height: 25,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}