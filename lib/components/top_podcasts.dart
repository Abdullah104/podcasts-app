import 'package:flutter/material.dart';
import 'package:podcasts_app/services/layout_service.dart';
import 'package:podcasts_app/services/locator.dart';

class TopPodcasts extends StatefulWidget {
  const TopPodcasts({super.key});

  @override
  State<TopPodcasts> createState() => _TopPodcastsState();
}

class _TopPodcastsState extends State<TopPodcasts> {
  final layoutService = locator<LayoutService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 100),
        child: Text('Top Podcasts'),
      ),
    );
  }
}
