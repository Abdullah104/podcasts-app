import 'package:flutter/material.dart';
import 'package:podcasts_app/components/bottom_panel.dart';
import 'package:podcasts_app/components/panel.dart';
import 'package:podcasts_app/root.dart';
import 'package:podcasts_app/services/layout_service.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'components/bottom_nav.dart';
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
          backgroundColor: Colors.transparent,
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
      home: Wrapper(child: Root()),
    );
  }
}

class Wrapper extends StatelessWidget {
  final Widget child;

  final layoutService = locator<LayoutService>();

  Wrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: SlidingUpPanel(
        controller: layoutService.globalPanelController,
        boxShadow: [],
        minHeight: 80,
        parallaxEnabled: true,
        backdropOpacity: 1,
        maxHeight: MediaQuery.sizeOf(context).height * .8,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        panel: FullPanel(),
        isDraggable: true,
        collapsed: BottomPanel(),
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          theme: Theme.of(context),
        ),
      ),
    );
  }
}
