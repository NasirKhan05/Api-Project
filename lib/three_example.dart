import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_post_api/Models/user_model.dart';
import 'package:http/http.dart'as http;

class ThreeExample extends StatefulWidget {
  const ThreeExample({super.key});

  @override
  State<ThreeExample> createState() => _ThreeExampleState();
}

class _ThreeExampleState extends State<ThreeExample> {
  
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map<String, dynamic> i in data){
        print(i['name']);
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else{
      return userList;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Course'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }else{
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Column(
                              children: [
                                ReusableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                                ReusableRow(title: 'UserName', value: snapshot.data![index].username.toString()),
                                ReusableRow(title: 'Email', value: snapshot.data![index].email.toString()),
                                ReusableRow(title: 'Address', value: snapshot.data![index].address!.geo!.lat.toString()),
                              ],
                            ),
                          );
                        }
                    );
                  }
                }
            ),
          )
        ],
      ),
    );
  }
}




class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}

