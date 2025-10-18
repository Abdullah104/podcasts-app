import 'package:flutter/material.dart';

class FullPanel extends StatefulWidget {
  const FullPanel({super.key});

  @override
  State<FullPanel> createState() => FullPanelState();
}

class FullPanelState extends State<FullPanel> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Play something from your library!'));
  }
}
