///
/// Project name : Umenoki
/// Description : Register page
/// Author : Xiao
/// Date : 2020-06-02
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/services/auth.dart';
import 'package:umenoki/src/services/validator.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final _formKey            = new GlobalKey<FormState>();
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading           = false;
  String _errorMessage      = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          showForm(),
        ],
      )
    );
  }

  Widget showForm() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: !_isLoading
        ? ListView(
            shrinkWrap: true,
            children: <Widget>[
              showErrormessage(),
              showEmailInput(),
              showPasswordInput(),
              showConfirmPasswordInput(),
              showRegisterButton(),
              showLoginLabel(),
            ],
          )
        : Center(
            child: CircularProgressIndicator(),
          ),
      ),
    );
  }

  Widget showErrormessage() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
      child: new Text(
        _errorMessage,
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _emailController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.mail,
            color: AppTheme.nearlyRed,
          )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter your email';
          } else if (!Validator.validateEmail(value)) {
            return 'The email is invalid';
          }
          return null;
        },
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _passwordController,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: AppTheme.nearlyRed,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty){
            return 'Please enter your password';
          } else if (value.length < 6) {
            return 'Password has to be more than 6 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget showConfirmPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Confirm password',
          icon: new Icon(
            Icons.lock,
            color: AppTheme.nearlyRed,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty){
            return 'Please enter your confirm password';
          } else if (value != _passwordController.text){
            return 'Not match';
          } else if (value.length < 6) {
            return 'Password has to be more than 6 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget showRegisterButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 45.0, 5.0, 0.0),
      child: SizedBox(
        height: 45.0,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          color: AppTheme.nearlyRed,
          child: Text('Register',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            )
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              this.setState(() {
                _isLoading = true;
              });
              Auth().createUser(_emailController.text, _passwordController.text).then((value) {
                this.setState(() {
                  _isLoading = false;
                });
                if (value == 'Success') {
                  Navigator.pushReplacementNamed(context, '/mybaby');
                } else {
                  _errorMessage = value;
                }
              });
            }
          },
        ),
      )
    );
  }

  Widget showLoginLabel() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/auth/login');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                color: AppTheme.nearlyRed,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}