import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_post_api/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 3), (timer){
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print('Hello World');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child){
          return Text(value.count.toString(),
            style: TextStyle(fontSize: 50),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            countProvider.setCount();
          },
          child: Icon(Icons.add),
      ),
    );
  }
}
