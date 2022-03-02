import 'package:flutter/material.dart';
import 'package:pruebapc/pages/lugarvisita_page.dart';
import 'package:pruebapc/pages/main_page.dart';

void main() {
  runApp(const AppState());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       // primarySwatch: Colors.yellow 
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        'home' : (BuildContext _)=> LugarVisitarPage()
      },
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyApp()
    );
  }
}
