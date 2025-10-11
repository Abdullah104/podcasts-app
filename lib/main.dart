import 'package:flutter/material.dart';

import 'services/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast',
      theme: ThemeData(
        primaryColor: Color(0xff004EFF),
        brightness: Brightness.light,
        fontFamily: 'SFProText',
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Color(0xff373539),
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xff373539),
          ),
          labelMedium: TextStyle(
            color: Color(0xff7B7A7C),
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
        appBarTheme: AppBarThemeData(
          iconTheme: IconThemeData(color: Color(0xff004EFF)),
          color: Colors.transparent,
          elevation: 0,
        ),
        dividerColor: Color(0xffE0E3E5),
        canvasColor: Colors.grey.shade50,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        tabBarTheme: TabBarThemeData(
          labelColor: Color(0xff004EFF),
          unselectedLabelColor: Color(0xff7B7A7C),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Color(0xff004EFF), width: 3),
            insets: EdgeInsets.only(right: 100),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Wrapper(child: SizedBox()),
    );
  }
}

class Wrapper extends StatelessWidget {
  final Widget child;

  const Wrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
