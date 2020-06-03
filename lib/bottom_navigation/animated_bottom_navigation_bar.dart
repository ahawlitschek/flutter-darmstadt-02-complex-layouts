import 'package:flutter/material.dart';
import 'package:flutterdarmstadt2/bottom_navigation/animated_bottom_bar_entry.dart';

class AnimatedBottomNavigationBar extends StatefulWidget {
  @override
  _AnimatedBottomNavigationBarState createState() =>
      _AnimatedBottomNavigationBarState();
}

class _AnimatedBottomNavigationBarState
    extends State<AnimatedBottomNavigationBar> {
  int _currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16, top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedBottomBarEntry(
              text: 'Home',
              iconData: Icons.home,
              color: Colors.deepPurple.shade100,
              selected: _currentItem == 0,
              onTap: () {
                setState(() {
                  _currentItem = 0;
                });
              },
            ),
            AnimatedBottomBarEntry(
              text: 'Likes',
              iconData: Icons.favorite_border,
              color: Colors.purple.shade100,
              selected: _currentItem == 1,
              onTap: () {
                setState(() {
                  _currentItem = 1;
                });
              },
            ),
            AnimatedBottomBarEntry(
              text: 'Search',
              iconData: Icons.search,
              color: Colors.orange.shade100,
              selected: _currentItem == 2,
              onTap: () {
                setState(() {
                  _currentItem = 2;
                });
              },
            ),
            AnimatedBottomBarEntry(
              text: 'Profile',
              iconData: Icons.person_outline,
              color: Colors.blue.shade100,
              selected: _currentItem == 3,
              onTap: () {
                setState(() {
                  _currentItem = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
