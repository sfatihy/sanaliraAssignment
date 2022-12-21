import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sanalira_example/model/bankModel.dart';
import 'package:sanalira_example/service/bankService.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BankProvider with ChangeNotifier {

  // Create User
  Future createUser(Map json) async {
    var prefs = await SharedPreferences.getInstance();

    List<String> userList = [];

    for (MapEntry data in json.entries) {
      userList.add(data.value.toString());
    }

    print(userList);

    prefs.setStringList("user", userList);

  }

  // if user is login already navigate to Home Page
  Future isUserLogIn() async {
    var prefs = await SharedPreferences.getInstance();

    var data = prefs.get("user");

    print(data);

    if(data == null) {
      return false;
    }
    else {
      return true;
    }

  }

  Future<BankModel> getBankData() async{
    var response = await BankService.getBankList();

    //print(jsonDecode(utf8.decode(response.bodyBytes)));

    return BankModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
  }


}