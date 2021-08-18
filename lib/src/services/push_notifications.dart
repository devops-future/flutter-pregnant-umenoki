///
/// Project name : Umenoki
/// Description : Push notification
/// Author : Xiao
/// Date : 2020-05-14
///

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();

      // For testing purposes print the Firebase Messaging token
      // String token = await _firebaseMessaging.getToken();
      _firebaseMessaging.getToken().then((token){
        print('Token_KEY: $token');
      });
      
      _initialized = true;
    }
  }
}