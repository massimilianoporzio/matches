import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matches/pages/main_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Partite',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey.shade300,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          backgroundColor: Colors.indigo, //* stessa colorazione
          elevation: 5,
        ),
        tabBarTheme: const TabBarTheme(
          unselectedLabelColor: Color(0x88FFFFFF), //tab non sel
          labelColor: Colors.white,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 1),
      ),
      home: const MainPage(),
    );
  }
}
