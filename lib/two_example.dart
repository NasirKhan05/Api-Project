import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TwoExample extends StatefulWidget {
  const TwoExample({super.key});

  @override
  State<TwoExample> createState() => _TwoExampleState();
}

class _TwoExampleState extends State<TwoExample> {
  
  List<Photos> photosList = [];
  
  Future<List<Photos>> getPhotos() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        Photos photos = Photos(title: i['title'], url: i['url']);
        photosList.add(photos);
      }
      return photosList;
    }else{
      return photosList;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Photos Api'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot){
                  return ListView.builder(
                    itemCount: photosList.length,
                      itemBuilder: (context, index){
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                        ),
                        title: Text(snapshot.data![index].title.toString()),
                      );
                      }
                  );
            }
            ),
          )
        ],
      ),
    );
  }
}

class Photos {
  final String title, url ;
  Photos({required this.title, required this.url});
}
