import 'package:dio/dio.dart';
import 'package:dioapi/http.dart';
import 'package:dioapi/model.dart';
import 'package:dioapi/singleuserresponse.dart';
import 'package:dioapi/userscreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HttpService http;
  late SingleUser singleUser;
  late User user;
  bool loading=false;
  Future getUser()async{
    Response response;
    try {
      loading=true;
      response=await http.getRequest("api/users/2");
      loading=false;
      if(response.statusCode==200){
       setState(() {
         singleUser=SingleUser.fromJson(response.data);
         user=singleUser.user;
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
        title: Text("Dio"),
      ),
      body: Center(
        child: loading ?CircularProgressIndicator():user!=null?Column(
          children: [
            Text(user.id.toString()),
            Text(user.email),
            Text(user.firstName),
            Text(user.lastName),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListUserScreen()));
            }, child: Text("GO"))
          ],
        ):Center(child: Text("no user"),),
      ),
    );
  }
}
