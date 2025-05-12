import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_post_api/Models/posts_model.dart';
import 'package:http/http.dart'as http;

class OneExampel extends StatefulWidget {
  const OneExampel({super.key});

  @override
  State<OneExampel> createState() => _OneExampelState();
}

class _OneExampelState extends State<OneExampel> {

  List<PostsModel> postList = [] ;

  Future<List<PostsModel>> getPostApi() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      postList.clear();
      for(Map<String, dynamic> i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }else{
      print('Api is hitted');
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Api"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context , snapshot){
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
                    print('Are you ready');
                    return ListView.builder(
                      itemCount: postList.length,
                        itemBuilder: (context, index){
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Title',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text(postList[index].title.toString()),
                                Text('Description',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text(postList[index].body.toString()),

                              ],
                            ),
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
