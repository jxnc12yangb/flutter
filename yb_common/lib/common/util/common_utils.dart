import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
/// @author yangbang
/// @create 2019/12/14
/// @Describe
class CommonUtils{

  static Future<void> showBottomView(BuildContext context,Widget widget,double percent) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
              child:Container(
                padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: widget,
              )
          );
        });
   /* return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: percent,
            child: widget,
          );
        });*/
        /*builder: (BuildContext context) {
          return new SafeArea(
              child: widget);
        }*/
  }

  static const chars = "abcdefghijklmnopqrstuvwxyz0123456789";

  static String RandomString(int strlen) {
    Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }

  static String deviceId = "";

  static Future<String> getDeviceId() async {
    String identifier;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid ) {
      var build = await deviceInfo.androidInfo;
      identifier = build.androidId;  //UUID for Android
    } else if(Platform.isIOS ){
      var data = await deviceInfo.iosInfo;
      identifier = data.identifierForVendor;  //UUID for iOS
    }
    return identifier;
  }

  static sortMapByKey(Map map){
    List <String> keys = map.keys.toList();
    // key排序
    keys.sort();
  }
}

class ValueUtil {

  static bool isEmpty(String value){
    return value==null||value.isEmpty;
  }

  static int toInt(dynamic value) {
    if (value is String) {
      if (value.length > 0) {
        var dv = double.parse(value);
        return toInt(dv);
      } else {
        return 0;
      }
    } else if (value is num) {
      return value.toInt();
    } else {
      return 0;
    }
  }

  static double toDouble(dynamic value) {
    if (value is String) {
      if (value.length > 0) {
        return double.parse(value);
      } else {
        return 0.0;
      }
    } else if (value is num) {
      return value.toDouble();
    } else {
      return 0.0;
    }
  }

  static String toStr(dynamic value) {
    if (value is String) {
      return value;
    } else if (value is num) {
      return value.toString();
    } else {
      return "";
    }
  }

  static List toArr(dynamic value) {
    if (value is List) {
      return value;
    } else {
      return [];
    }
  }

  static Map toMap(dynamic value) {
    if (value is Map) {
      return value;
    } else {
      return {};
    }
  }

  static num toNum(dynamic value) {
    if (value is num) {
      return value;
    } else if (value is String) {
      if (value.contains(".")) {
        return double.parse(value);
      } else {
        return int.parse(value);
      }
    } else {
      return -666;
    }
  }

  static bool toBool(dynamic value) {
    if (value is bool) {
      return value;
    } else {
      int intValue = ValueUtil.toInt(value);
      return intValue != 0;
    }
  }
}

class DeviceInfo{

  static String deviceName;
  static String deviceVersion;
  static String identifier;
  static String param = "";
  static Future<List<String>> getDeviceInfo() async {

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid ) {
      var build = await deviceInfo.androidInfo;
      deviceName = build.model;
      deviceVersion = build.version.toString();
      identifier = build.androidId;  //UUID for Android
      param = "Android";
    } else if(Platform.isIOS ){
      var data = await deviceInfo.iosInfo;
      deviceName = data.name;
      deviceVersion = data.systemVersion;
      identifier = data.identifierForVendor;  //UUID for iOS
      param = "IOS";
    }
    return [deviceName, deviceVersion, identifier];
  }


  static String getString() {
    // TODO: implement toString
    return "$param $deviceName";
  }



}


