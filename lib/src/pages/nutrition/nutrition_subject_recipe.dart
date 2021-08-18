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

class NutritionSubjectRecipePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _NutritionSubjectRecipePageState();
}

class _NutritionSubjectRecipePageState extends State<NutritionSubjectRecipePage>{
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
                _ingredientsWidget(context),
                _methodWidget(context),
                _footerWidget(context),
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _appBarWidget(BuildContext context, String title) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
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
          Navigator.pushReplacementNamed(
              context, '/nutrition/subject/detail',
              arguments: {
                'title': arguments['prevtitle'],
              }
          );
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
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 50, bottom: 10),
          child: Image(
            image: AssetImage("assets/components/nutrition/img_subject_detail_item.png"),
            width: MediaQuery.of(context).size.width + 20,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image(
                  width: 40,
                  height: 25,
                  image: AssetImage("assets/components/nutrition/icn_heart.png"),
                  fit:BoxFit.contain,
                ),
                Text(
                  '気に入り',
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Image(
                  width: 40,
                  height: 25,
                  image: AssetImage("assets/components/nutrition/icn_save.png"),
                  fit:BoxFit.contain,
                ),
                Text(
                  '保存',
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Image(
                  width: 40,
                  height: 25,
                  image: AssetImage("assets/components/nutrition/icn_share.png"),
                  fit:BoxFit.contain,
                ),
                Text(
                  '共有',
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left:30, top:30, bottom: 30),
          child: Text(
            '旬カツオのガーリックバターステーキ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 19),
            ),
            Container(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/components/nutrition/icn_minus.png"),
                    width: 25,
                    height: 25,
                    fit:BoxFit.contain
                  ),
                  Text(
                    '2',
                    style: TextStyle(fontSize: 19),
                  ),
                  Image(
                      image: AssetImage("assets/components/nutrition/icn_add.png"),
                      width: 25,
                      height: 25,
                      fit:BoxFit.contain
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _ingredientsWidget(BuildContext context) {
    List<String> listContents = ['カツオ (柵)','塩','薄力粉','オリーブオイル','ニンニク','生姜','有塩バター','しょうゆ','酒','小ねぎ',];
    List<String> listAmounts = ['200g','適量','適量','大さじ1','4片','5g','10g','大さじ1','大さじ1','適量',];
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, right:20),
      child: Card(
        child: ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: listContents.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width:170,
                  margin: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                  child: Text(
                    listContents[index],
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Text(
                  listAmounts[index],
                  style: TextStyle(fontSize: 15),
                ),
              ],
            );
          }
        ),
      )
    );
  }

  Widget _methodWidget(BuildContext context) {
    List<String> listContents = ['ニンニクを薄切りにします。',
      '生姜を千切りにします。',
      'カツオを2~3cm幅に切り、全体に塩をまぶします。',
      '3に薄力粉をふりまぶします。',
      'フライパンにオリーブオイルをひき、カツオに火を通します。火が通ったら一度フライパンから取り出します。',
      'フライパンにバターを熱し、ニンニクと生姜を入れます。香りが立ったらしょうゆと酒を入れ、5を片面1分ずつ焼きながら、タレをなじませて完成です。',];

    return Container(
        margin: EdgeInsets.all(30),
        child: ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: listContents.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
          return
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child:Row(
                children: <Widget>[
                  Container(
                    width:40,
                    child: Text(
                      (index+1).toString()+'.',
                      style: TextStyle(fontSize: 30, color: Color(0xffFD5562)),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      listContents[index],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
    );
  }

  Widget _footerWidget(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(30),
      child: Column (
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image(
                image: AssetImage("assets/components/nutrition/icn_heart_full.png"),
                width: 40,
                height:25,
                fit:BoxFit.contain,
              ),
              Text(
                '609',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Color(0xFFFE9F6F)),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image(
                    width: 40,
                    height:40,
                    image: AssetImage("assets/components/nutrition/icn_user.png"),
                  ),
                  Text(
                    ' 真子',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Color(0xFFFE9F6F)),
                  )
                ],
              ),
              Text(
                '02.04.2020',
                style: TextStyle(fontSize: 14,),
              )
            ],
          ),
          Text(
            'Thank you so so much!               ',
            style: TextStyle(fontSize: 14,),
          )
        ],
      )
    );
  }

  void _onTileClicked(int index){
    debugPrint("You tapped on item $index");
  }
}