import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/core/helpers/cache_helper.dart';
import 'package:food_recipes/core/helpers/extensions.dart';
import 'package:food_recipes/core/routing/routes.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context){
    return BlocProvider.of(context);
  }

  bool isLightTheme =  CacheHelper.getData(key: 'isLightTheme') ?? true;

  void changeTheme(){
    isLightTheme =!isLightTheme;
    CacheHelper.saveData(key: 'isLightTheme', value: isLightTheme);

    emit(ChangeThemeSuccess());
  }

   getNotificationByToken()async{
    String ? token = await FirebaseMessaging.instance.getToken();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(token);
  }

  getLocalNotification(context){
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage ) {
      if(remoteMessage.notification != null){
        AwesomeDialog(context:context,title: remoteMessage.notification!.title ,body: Text(remoteMessage.notification!.body!),dialogType: DialogType.info  ).show();
      }
    });
  }

  openNotification(BuildContext context){
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage ) {
      if(remoteMessage.data['type'] == "new recipe"){
        context.pushNamed(Routes.foodRecipesDetailsView,arguments: remoteMessage.data["id"]);
      }
    });
  }


}
