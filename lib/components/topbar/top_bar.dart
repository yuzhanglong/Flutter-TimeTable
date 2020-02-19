import 'package:flutter/cupertino.dart';
import 'package:zucc_helper/components/topbar/top_bar_item.dart';

class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TopBarItem(),
    );
  }
}
