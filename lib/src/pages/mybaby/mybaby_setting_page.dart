///
/// Project name : Umenoki
/// Description : My baby setting page
/// Author : Xiao
/// Date : 2020-06-02
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umenoki/src/models/setting_model.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/widgets/shape_border_widget.dart';
import 'package:umenoki/src/widgets/radio_widget.dart';
import 'package:umenoki/src/widgets/input_widget.dart';
import 'package:umenoki/src/widgets/switch_widget.dart';

class MyBabySettingPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _MyBabySettingPageState();
}

class _MyBabySettingPageState extends State<MyBabySettingPage>{
  final nameController      = TextEditingController();
  final emailController     = TextEditingController();
  final passController      = TextEditingController();
  final countryController   = TextEditingController();
  final ageController       = TextEditingController();
  final babyNameController  = TextEditingController();
  final curWeekController   = TextEditingController();
  final dueDateController   = TextEditingController();
  final heightController    = TextEditingController();

  String babyGender         = '2';
  String babySkin           = '0';
  String givenBirth         = '0';
  bool appleWatch           = false;
  bool fitbit               = false;
  bool notification         = false;

  Future<Map> future() {
    return SettingModel().getSetting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder(context),
      body: _bodyBuilder(context),
    );
  }

  // app bar builder
  Widget _appBarBuilder(BuildContext context) {
    return AppBar(
      title: Text("Settings", style: AppTheme.title,),
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
          Navigator.pushReplacementNamed(context, '/mybaby');
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Text("Save", style: AppTheme.title,),
          iconSize: AppTheme.iconSize,
          onPressed: (){
            List settingData = [
              nameController.text,
              emailController.text,
              passController.text,
              countryController.text,
              ageController.text,
              babyNameController.text,
              babyGender,
              babySkin,
              curWeekController.text,
              dueDateController.text,
              heightController.text,
              givenBirth,
              appleWatch,
              fitbit,
              notification,
            ];
            
            SettingModel().saveSetting(settingData).then((value){
              final snackBar = SnackBar(
                content: Text('Data is saved successfully'),
                backgroundColor: Colors.green,
                action: SnackBarAction(
                  label: 'Close',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            });
          },
        ),
      ],
    );
  }

  ///
  /// If snapshot (get setting data from firebase) has data, return setting builder and if not, loading.
  /// @param BuildContext $context
  /// @return Widget
  /// 
  Widget _bodyBuilder(BuildContext context) {
    return FutureBuilder<Map>(
      future: future(),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.hasData){
          return _settingBuilder(context, snapshot);
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Connect Error...'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // setting widget builder
  Widget _settingBuilder(BuildContext context, AsyncSnapshot<Map> snapshot) {
    // text field
    nameController.text     = snapshot.data['name'];
    emailController.text    = snapshot.data['email'];
    passController.text     = snapshot.data['password'];
    countryController.text  = snapshot.data['country'];
    ageController.text      = snapshot.data['age'];
    babyNameController.text = snapshot.data['baby_name'];
    curWeekController.text  = snapshot.data['cur_week'];
    dueDateController.text  = snapshot.data['due_date'];
    heightController.text   = snapshot.data['height'];

    // radio button
    babyGender              = snapshot.data['baby_gender'];
    babySkin                = snapshot.data['baby_skin'];
    givenBirth              = snapshot.data['given_birth'];

    // switch
    appleWatch              = snapshot.data['apple_watch'];
    fitbit                  = snapshot.data['fitbit'];
    notification            = snapshot.data['notification'];

    return ListView(
      children: <Widget>[
        Image.asset(
          "assets/components/bg_setting_top1.png",
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
        ),

        // basic information
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ImageIcon(
                    AssetImage("assets/components/icn_device_info.png"),
                    size: AppTheme.iconSize,
                    color: AppTheme.nearlyDarkRed,
                  ),
                  Text(
                    "Basic Information",
                    style: AppTheme.subTitle,
                  ),
                ],
              ),
              InputField(
                label: "Your name",
                controller: nameController,
              ),
              InputField(
                isReadOnly: true,
                label: "Your e-mail",
                controller: emailController,
              ),
              InputField(
                label: "Password",
                controller: passController,
                obscureText: true,
              ),
              InputField(
                label: "Country",
                controller: countryController,
              ),
              InputField(
                label: "Age",
                controller: ageController,
              ),

              // pregnancy information
              new Row(
                children: <Widget>[
                  ImageIcon(
                    AssetImage("assets/components/icn_map_health.png"),
                    size: AppTheme.iconSize,
                    color: AppTheme.nearlyDarkRed,
                  ),
                  Text(
                    "Pregnancy Information",
                    style: AppTheme.subTitle,
                  ),
                ],
              ),
              InputField(
                label: "Baby's name",
                controller: babyNameController,
              ),

              Padding(
                padding: const EdgeInsets.only(top:5, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Baby's gender",
                      style: AppTheme.bodyText,
                    ),
                    Spacer(),
                    Container(
                      width: 200.0,
                      padding: const EdgeInsets.only(left: 0),
                      child: CustomRadioButton(
                        enableShape: true,
                        buttonColor: Theme.of(context).canvasColor,
                        status: "wrap",
                        buttonLabels: [
                          "Male",
                          "Female",
                          "          Do not know          ",
                        ],
                        buttonValues: [
                          "0",
                          "1",
                          "2",
                        ],
                        radioButtonValue: (value) {
                          babyGender = value;
                        },
                        selectedColor: AppTheme.nearlyPink,
                        currentSelectedValue: babyGender,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:5, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Skin colour of\nthe baby's icon",
                      style: AppTheme.bodyText,
                    ),
                    Spacer(),
                    Container(
                      width: 200.0,
                      padding: const EdgeInsets.only(left: 0),
                      child: CustomRadioButton(
                        enableShape: true,
                        status: "skin",
                        buttonColor: Theme.of(context).canvasColor,
                        buttonLabels: [
                          "",
                          "",
                          "",
                        ],
                        buttonValues: [
                          "0",
                          "1",
                          "2",
                        ],
                        radioButtonValue: (value) {
                          babySkin = value;
                        },
                        selectedColor: AppTheme.nearlyPink,
                        currentSelectedValue: babySkin,
                      ),
                    ),
                  ],
                ),
              ),
              InputField(
                label: "Current week",
                controller: curWeekController,
              ),
              InputField(
                label: "Due date",
                controller: dueDateController,
              ),
              InputField(
                label: "Height",
                controller: heightController,
              ),

              Padding(
                padding: const EdgeInsets.only(top:25.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Have you given birth before?",
                      style: AppTheme.bodyText,
                    ),
                  ],
                ),
              ),
              
              CustomRadioButton(
                enableShape: true,
                buttonColor: Theme.of(context).canvasColor,
                status: "wrap",
                buttonLabels: [
                  "No",
                  "Yes, I have 1 child",
                  "Yes, I have 2",
                  "Yes, I have 3",
                  "Yes, I have 4+",
                ],
                buttonValues: [
                  "0",
                  "1",
                  "2",
                  "3",
                  "4",
                ],
                radioButtonValue: (value) {
                  givenBirth = value;
                },
                selectedColor: AppTheme.nearlyPink,
                currentSelectedValue: givenBirth,
              ),
              // devices
              new Row(
                children: <Widget>[
                  ImageIcon(
                    AssetImage("assets/components/icn_backup_restore.png"),
                    size: AppTheme.iconSize,
                    color: AppTheme.nearlyDarkRed,
                  ),
                  Text(
                    "Devices",
                    style: AppTheme.subTitle,
                  ),
                ],
              ),
              
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("Apple Watch",
                      style: AppTheme.bodyText,
                    ),
                    Spacer(),
                    CustomSwitch(
                      activeColor: AppTheme.nearlyPink,
                      value: appleWatch,
                      onChanged: (value) {
                        appleWatch = value;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("Fitbit",
                      style: AppTheme.bodyText,
                    ),
                    Spacer(),
                    CustomSwitch(
                      activeColor: AppTheme.nearlyPink,
                      value: fitbit,
                      onChanged: (value) {
                        fitbit = value;
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(35.0),
                      side: BorderSide(color: Colors.red)),
                    onPressed: () {},
                    color: AppTheme.nearlyPink,
                    textColor: Colors.white,
                    child: Text(
                      "Add new device",
                      style: AppTheme.bodyText,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: <Widget>[
                    Text("Notifications",
                      style: AppTheme.bodyText,
                    ),
                    Spacer(),
                    CustomSwitch(
                      activeColor: AppTheme.nearlyPink,
                      value: notification,
                      onChanged: (value) {
                        notification = value;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Image.asset(
            "assets/components/bg_setting_bottom.png",
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}