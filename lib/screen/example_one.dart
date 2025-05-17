import 'package:flutter/material.dart';
import 'package:get_post_api/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  Widget build(BuildContext context) {
    print('Hello World');
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Provider Example', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value, chils){
            return Slider(
              min: 0,
                max: 1,
                value: value.value, onChanged: (val){
              value.setValue(val);
            });
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child){
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value)
                    ),
                    child: Center(child: Text('Container 2')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)
                    ),
                    child: Center(child: Text('Container 1')),
                  ),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
