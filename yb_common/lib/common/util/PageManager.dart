import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// @author yangbang
/// @create 2019/12/26
/// @Describe
class PageManager{

  static void pop(context,{arguments}){
    Navigator.of(context).pop(arguments);
  }

  static Future pushNamed(context,name,{arguments}){
    return Navigator.pushNamed(context,name,arguments:arguments==null?arguments:Map.from(arguments));
  }

  static void pushNamedNotCopy(context,name,{arguments}){
    Navigator.pushNamed(context,name,arguments:arguments==null?arguments:arguments);
  }

  static void popAndpushName(context,name,{arguments}){
    Navigator.popAndPushNamed(context,name,arguments:arguments==null?arguments:Map.from(arguments));
  }

  static void popWidget(context,widget){
    //MaterialPageRoute
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (_) {
      return widget;
    }));

  }

  static void popApp(context,{arguments}){
    if(Navigator.canPop(context)){
      PageManager.pop(context);
    }else{
      SystemNavigator.pop();
    }
  }




}