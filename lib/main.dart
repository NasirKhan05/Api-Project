import 'package:flutter/material.dart';
import 'package:get_post_api/provider/count_provider.dart';
import 'package:get_post_api/provider/example_one_provider.dart';
import 'package:get_post_api/screen/count_example.dart';
import 'package:get_post_api/screen/example_one.dart';
import 'package:get_post_api/three_example.dart';
import 'package:get_post_api/two_example.dart';
import 'package:provider/provider.dart';

import 'one_exampel.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        home: ExampleOne(),
      ),
    );
  }
}
