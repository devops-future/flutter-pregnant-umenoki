///
/// Project name : Umenoki
/// Description : Nutrition page
/// Author : Xiao
/// Date : 2020-06-02
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/widgets/shape_border_widget.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:imagebutton/imagebutton.dart';

class NutritionPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: _bodyWidget(context,)
    );
  }

  /// 
  /// Appbar builder
  /// @param BuildContext context
  /// @return AppBar
  /// 
  Widget _appBarWidget(BuildContext context) {
    return AppBar(
      title: Text("Nutrition", style: AppTheme.title,),
      centerTitle: true,
      backgroundColor: AppTheme.nearlyRed,
      shape: CustomShapeBorder(),
      // elevation: 5.0,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
          
      //   },
      // ),
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

  /// 
  /// Tab builder of body
  /// @param BuildContext context
  /// @return DefaultTabController
  /// 
  Widget _bodyWidget(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 55.0),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,     // tab
              indicator: BubbleTabIndicator(
                indicatorHeight: 40.0,
                indicatorColor: Color(0xFFFFE5E5),
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
              tabs: [
                Tab(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Recommended", style: AppTheme.tabText,),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Nutrients", style: AppTheme.tabText,),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Symptoms", style: AppTheme.tabText,),
                    ),
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: Container(
              child: TabBarView(children: [
                Container(
                  child: _recommendedTabPage(context)
                ),
                Container(
                  child: _nutrientsTabPage(context)
                ),
                Container(
                  child: _symptomsTabPage(context)
                ),
              ]),
            )
          )
        ],
      ),
    );
  }

  ///
  /// Recommended tab build
  /// @param BuildContext context
  /// @return Widget
  ///
  Widget _recommendedTabPage(BuildContext context) {
    return Center(
      child: Text('Recommended'),
    );
  }

  ///
  /// Nutrients tab build
  /// @param BuildContext context
  /// @return Widget
  /// 
  Widget _nutrientsTabPage(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 70.0, left: 10.0, right: 10.0, bottom: 10.0),
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                ImageButton(
                  children: <Widget>[],
                  width: 150.0,
                  height: 150.0,
                  pressedImage: Image.asset(
                    "assets/components/nutrition/img_folate_s.png",
                  ),
                  unpressedImage: Image.asset("assets/components/nutrition/img_folate.png"),
                  onTap: () {
                    print('test');
                  },
                ),
                Text('Folate'),
              ],
            )
          ),
          Center(
            child: Column(
              children: <Widget>[
                ImageButton(
                  children: <Widget>[],
                  width: 150.0,
                  height: 150.0,
                  pressedImage: Image.asset(
                    "assets/components/nutrition/img_calcium_s.png",
                  ),
                  unpressedImage: Image.asset("assets/components/nutrition/img_calcium.png"),
                  onTap: () {
                    print('test');
                  },
                ),
                Text('Calcium'),
              ],
            )
          ),
          Center(
            child: Column(
              children: <Widget>[
                ImageButton(
                  children: <Widget>[],
                  width: 150.0,
                  height: 150.0,
                  pressedImage: Image.asset(
                    "assets/components/nutrition/img_protein_s.png",
                  ),
                  unpressedImage: Image.asset("assets/components/nutrition/img_protein.png"),
                  onTap: () {
                    print('test');
                  },
                ),
                Text('Protein'),
              ],
            )
          ),
          Center(
            child: Column(
              children: <Widget>[
                ImageButton(
                  children: <Widget>[],
                  width: 150.0,
                  height: 150.0,
                  pressedImage: Image.asset(
                    "assets/components/nutrition/img_iron_s.png",
                  ),
                  unpressedImage: Image.asset("assets/components/nutrition/img_iron.png"),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context, '/nutrition/subject',
                      arguments: {
                        'title': '鉄',
                        'description': 'Description',
                      }
                    );
                  },
                ),
                Text('Iron'),
              ],
            )
          ),
        ],
      )
    );
  }

  ///
  /// Symptoms tab build
  /// @param BuildContext context
  /// @return Widget
  /// 
  Widget _symptomsTabPage(BuildContext context) {
    return Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(top: 70.0, left: 10.0, right: 10.0, bottom: 10.0),
          children: <Widget>[
            Center(
                child: Column(
                  children: <Widget>[
                    ImageButton(
                      children: <Widget>[],
                      width: 150.0,
                      height: 150.0,
                      pressedImage: Image.asset(
                        "assets/components/nutrition/img_swelling_s.png",
                      ),
                      unpressedImage: Image.asset("assets/components/nutrition/img_swelling.png"),
                      onTap: () {
                        print('Swelling');
                      },
                    ),
                    Text('Swelling'),
                  ],
                )
            ),
            Center(
                child: Column(
                  children: <Widget>[
                    ImageButton(
                      children: <Widget>[],
                      width: 150.0,
                      height: 150.0,
                      pressedImage: Image.asset(
                        "assets/components/nutrition/img_anemia_s.png",
                      ),
                      unpressedImage: Image.asset("assets/components/nutrition/img_anemia.png"),
                      onTap: () {
                        print('Anemia');
                      },
                    ),
                    Text('Anemia'),
                  ],
                )
            ),
            Center(
                child: Column(
                  children: <Widget>[
                    ImageButton(
                      children: <Widget>[],
                      width: 150.0,
                      height: 150.0,
                      pressedImage: Image.asset(
                        "assets/components/nutrition/img_constipation_s.png",
                      ),
                      unpressedImage: Image.asset("assets/components/nutrition/img_constipation.png"),
                      onTap: () {
                        print('Constipation');
                      },
                    ),
                    Text('Constipation'),
                  ],
                )
            ),
            Center(
                child: Column(
                  children: <Widget>[
                    ImageButton(
                      children: <Widget>[],
                      width: 150.0,
                      height: 150.0,
                      pressedImage: Image.asset(
                        "assets/components/nutrition/img_diabetes_s.png",
                      ),
                      unpressedImage: Image.asset("assets/components/nutrition/img_diabetes.png"),
                      onTap: () {
                        print('Diabetes');
                      },
                    ),
                    Text('Diabetes'),
                  ],
                )
            ),
          ],
        )
    );
  }
}