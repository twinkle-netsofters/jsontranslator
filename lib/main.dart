import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:translator/translator.dart';
import 'Screeens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const color = Color(0xff127681);
    return MaterialApp(
      locale: Locale('fr','FR'),

      //initialRoute: '/home,da',
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Home(),
    );
  }
}

