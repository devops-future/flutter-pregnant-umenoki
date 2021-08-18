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

class NutritionSubjectDetailPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _NutritionSubjectDetailPageState();
}

class _NutritionSubjectDetailPageState extends State<NutritionSubjectDetailPage>{
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
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
              context, '/nutrition/subject',
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
    final _searchController      = TextEditingController();
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage("assets/components/nutrition/img_fish.png"),
          width: 200,
          height: 140,
          fit: BoxFit.contain,
        ),
        Text(
          arguments['title'],
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '200 mg',
          style: TextStyle(fontSize: 20),
        ),
        Container(
          margin: EdgeInsets.only(left: 40, right:40),
          child:Image(
            image: AssetImage("assets/components/nutrition/img_nutrition_subject_baby.png"),
            height: 80,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffFEA4B7),
              width: 1, //                   <--- border width here
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(25.0) //         <--- border radius here
            ),
          ),
          child: Row(
            children: <Widget>[
              Center(
                child: Image(
                  width: 50,
                  height: 16,
                  image: AssetImage("assets/components/nutrition/icn_search.png"),
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                child: TextField(
                  readOnly: false,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                  )
                ),
              ),
              ButtonTheme(
                height: 50.0,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Color(0xffFEA4B7))),
                  color: Color(0xFFFFF4F4),
                  textColor: Color(0xffFE9E6F),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Text(
                    "全て",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _bodyWidget(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    List<String> listTitle = ['旬カツオのガーリックバターステーキ','マグロの照り焼きステーキ','旬カツオのガーリックバターステーキ','マグロの照り焼きステーキ','旬カツオのガーリックバターステーキ','マグロの照り焼きステーキ','旬カツオのガーリックバターステーキ','マグロの照り焼きステーキ',];
    return Container(
      margin: EdgeInsets.only(left: 10, right:10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listTitle.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.85,),
        itemBuilder: (context, indx){
          return Container(
            margin: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5),
                  height: 40,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: listTitle[indx],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, '/nutrition/subject/recipe',
                        arguments: {
                          'title': 'Fish',
                          'description': listTitle[indx],
                          'prevtitle': arguments['title'],
                        }
                    );
                  },
                  child:
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 100,
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/components/nutrition/img_subject_detail_item.png"),
                        height:100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image(
                      width: 20,
                      height: 12,
                      image: AssetImage("assets/components/nutrition/icn_heart.png"),
                      fit: BoxFit.contain,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        '609',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xffE37E29),
                        ),
                      ),
                    ),
                    Image(
                      width: 20,
                      height: 12,
                      image: AssetImage("assets/components/nutrition/icn_like.png"),
                      fit: BoxFit.contain,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                          '120',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xffE37E29),
                          ),
                      ),
                    ),
                  ],
                )
              ],
            )
          );
        },
      ),
    );
  }
}