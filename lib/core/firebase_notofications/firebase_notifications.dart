import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:food_recipes/core/routing/routes.dart';
import 'package:food_recipes/main.dart';

class FirebaseNotifications{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void>  initNotifications()async{
    await _firebaseMessaging.requestPermission();
    String ? token = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print(token);
    }
    handleBackgroundNotification();
  }


  void handleMessage(RemoteMessage? remoteMessage)async{
    if(remoteMessage == null){
      return;
    }
    navigatorKey.currentState!.pushNamed(Routes.newRecipesView);
  }


  Future  handleBackgroundNotification()async{
    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }



}