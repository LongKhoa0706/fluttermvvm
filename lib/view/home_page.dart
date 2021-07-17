import 'package:flutter/material.dart';
import 'package:fluttermvvm/model/user.dart';
import 'package:fluttermvvm/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();
  User user = User();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Consumer<UserViewModel>(
          builder: (BuildContext context, value, Widget? child) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: textEditingController,
                ),
                RaisedButton(
                  onPressed: () async {
                    user.name =  textEditingController.text;
                    value.addUser(user);
                  },
                  child: Text("OK"),
                ),
                RaisedButton(
                  onPressed: () async {
                    value.getUser();
                  },
                  child: Text("GET"),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.listUser.length,
                    itemBuilder: (_,index){
                      return Text(value.listUser[index].name.toString());
                    },
                  ),
                )
              ],
            );
          },
        )
      ),
    );
  }
}
