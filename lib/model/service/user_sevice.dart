import 'package:fluttermvvm/model/database/db_helper.dart';
import 'package:fluttermvvm/model/user.dart';
import 'package:fluttermvvm/viewmodel/user_viewmodel.dart';

class UserService{
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future addUser(User user) async {
    await databaseHelper.createDatabase();
    await databaseHelper.database?.insert('user', user.toJson());
  }

  Future<List<User>> getUser() async {
    List<User> listUser = [];
    await databaseHelper.createDatabase();
    var res = await databaseHelper.database?.query("user");
    res!.forEach((element) {
      listUser.add(User.fromJson(element));
    });
    return listUser;
  }

}