import 'package:flutter/material.dart';
import 'package:podcasts_app/custom_icons_icons.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nothing is playing',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Container(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Icon(CustomIcons.play),
          ),
        ],
      ),
    );
  }
}
