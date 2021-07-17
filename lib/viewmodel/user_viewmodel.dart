import 'package:flutter/material.dart';
import 'package:fluttermvvm/model/service/user_sevice.dart';
import 'package:fluttermvvm/model/user.dart';

class UserViewModel extends ChangeNotifier {
  UserService? userService;
  List<User> listUser = [];

  UserViewModel({@required this.userService});

  void addUser(User user) async {
    userService?.addUser(user);
    getUser();
    notifyListeners();
  }
  void getUser() async {
   listUser = await userService!.getUser();
   notifyListeners();
  }

}
