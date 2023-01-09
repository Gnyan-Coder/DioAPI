import 'package:dio/dio.dart';
import 'package:dioapi/http.dart';
import 'package:dioapi/listusermodel.dart';
import 'package:flutter/material.dart';
import 'model.dart';
class ListUserScreen extends StatefulWidget {
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  State<ListUserScreen> createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  bool loading=false;
  late HttpService http;
  late ListUser listUser;
  late List<User> user;

  Future getUser()async{
    Response response;
    try {
      // https://reqres.in/api/users?page=2
      loading=true;
      response=await http.getRequest("api/users?page=2");
      loading=false;
      if(response.statusCode==200){
        setState(() {
          listUser=ListUser.fromJson(response.data);
          user=listUser.users;
        });
      }else{
        debugPrint("problem with status code");
      }
    } on Exception catch (e) {
      loading=false;
      debugPrint(e.toString());
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    http=HttpService();
    getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("multiple list"),
      ),
      body: Center(
        child: loading?CircularProgressIndicator():Center(
          child: ListView.builder(
            itemCount: user.length,
              itemBuilder: (context,index){
            return ListTile(
              leading:Image.network(user[index].avatar.toString()),
              title: Text(user[index].email.toString()),
            );
          }),
        )
        ),
    );
  }
}
