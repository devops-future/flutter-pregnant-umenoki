///
/// Project name: Umenoki
/// Description: Nutrition subject page
/// Author: Xiao
/// Date: 2020-06-10
/// 

import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/widgets/shape_border_widget.dart';
import 'package:sticky_headers/sticky_headers.dart';

class NutritionSubjectPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _NutritionSubjectPageState();
}

class _NutritionSubjectPageState extends State<NutritionSubjectPage>{
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBarWidget(context, arguments['title']),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _headerWidget(context),
                _bodyWidget(context),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _appBarWidget(BuildContext context, String title) {
    return AppBar(
      title: Text(title, style: AppTheme.title,),
      centerTitle: true,
      backgroundColor: AppTheme.nearlyRed,
      shape: CustomShapeBorder(),
      // elevation: 5.0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/nutrition');
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: ImageIcon(
            AssetImage("assets/components/nutrition/icn_plus.png"),
            size: AppTheme.iconSize,
            color: Colors.white,
          ),
          iconSize: AppTheme.iconSize,
          onPressed: (){

          },
        ),
      ],
    );
  }

  Widget _headerWidget(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage("assets/components/nutrition/bg_sub_nutrition.png"),
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          margin: EdgeInsets.only(top: 200),
          child:
          Align(
            alignment: Alignment.topCenter,
            child:Container(
              margin: EdgeInsets.only(bottom: 150),
              width: 150,
              height: 150,
              child:
              Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/components/nutrition/img_circle_nutrition.png"),
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          ' ',
                          style: TextStyle(color: Color(0x000000), fontSize: 23, fontFamily: 'Avenir'),
                        ),
                        Image(
                          image: AssetImage("assets/components/nutrition/img_iron_icon.png"),
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          arguments['title'],
                          style: TextStyle(color: Color(0xff000000), fontSize: 23, fontFamily: 'Avenir'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
            margin: EdgeInsets.only(left: 40, top: 400, right:40),
            child:RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '妊娠中は鉄が不足し貧血になりやすいため、鉄を多く含む食品を積極的に取りましょう。またビタミンCと一緒に摂ると鉄の吸収率が高まるので一緒に食べるのがおすすめです。ただし、コーヒーや紅茶に含まれるタンニンは鉄の吸収を阻害してしまうため食事中は避けましょう。',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
            ),
            Text(
              ' ',
            ),
            Text(
              ' ',
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right:40),
              child:Image(
                image: AssetImage("assets/components/nutrition/img_nutrition_subject_baby.png"),
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bodyWidget(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    List<String> listTitle = ['小松菜','ほうれん草','ひじき','大豆','カツオ','あさり','牡蠣','イワシ','赤具',];
    return Container(
      margin: EdgeInsets.only(left: 10, right:10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listTitle.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,),
        itemBuilder: (context, indx){
          return Container(
            margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, '/nutrition/subject/detail',
                        arguments: {
                          'title': listTitle[indx],
                          'description': 'Description',
                          'prevtitle': arguments['title'],
                        }
                    );
                  },
                  child:
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/components/nutrition/img_nutrition_subject_circle_cover.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/components/nutrition/img_fish.png"),
                        width: 100,
                        height:100,
                      ),
                    ),
                  ),
                ),
                Text(
                  ' ',
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: listTitle[indx],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '200 mg',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            )
          );
        },
      ),
    );
  }

  void _onTileClicked(int index){
    debugPrint("You tapped on item $index");
  }
}