import 'package:flutter/material.dart';
import 'package:podcasts_app/custom_icons_icons.dart';
import 'package:podcasts_app/services/layout_service.dart';
import 'package:podcasts_app/services/locator.dart';

import 'pages/top_podcasts.dart';
import 'data.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin {
  final layoutService = locator<LayoutService>();

  late final TabController tabController;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageView(
      controller: layoutService.globalPageController,
      children: [
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text('Library', style: theme.textTheme.titleMedium),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TabBar(
                  controller: tabController,
                  onTap: updatePage,
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Listen now'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Discover'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Favorite'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox.fromSize(size: Size.fromHeight(1), child: Divider()),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: updateTab,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 30),
                        Subtitle(text: 'Top podcasts in books'),
                        Container(
                          height: 200,
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: podcasts.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 200,
                                height: 200,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(podcasts[index]),
                              );
                            },
                          ),
                        ),
                        Subtitle(text: 'Playlists'),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            itemCount: playListItems.length,
                            itemBuilder: (context, index) {
                              return PlaylistItem(index: index);
                            },
                          ),
                        ),
                      ],
                    ),
                    Center(child: Text('Discover')),
                    Center(child: Text('Favorite')),
                  ],
                ),
              ),
              SizedBox(height: 180),
            ],
          ),
        ),
        Material(child: Center(child: Text('New'))),
        Material(child: Center(child: Text('Profile'))),
      ],
    );
  }

  void updateTab(int index) => tabController.animateTo(index);

  void updatePage(int index) => pageController.animateToPage(
    index,
    duration: Duration(milliseconds: 200),
    curve: Curves.easeIn,
  );
}

class PlaylistItem extends StatelessWidget {
  final int index;

  const PlaylistItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Icon(CustomIcons.play, color: theme.primaryColor),
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      playListItems[index]!['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      playListItems[index]!['author'],
                      style: theme.textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Text(
                playListItems[index]!['duration'],
                style: theme.textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  final String text;

  const Subtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: Theme.of(context).textTheme.bodyMedium),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopPodcasts()),
                ),
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
