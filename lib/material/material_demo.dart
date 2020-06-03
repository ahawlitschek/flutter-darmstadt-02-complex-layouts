import 'package:flutter/material.dart';
import 'package:flutterdarmstadt2/nutrition/styles.dart';

class MaterialDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Material App'),
        ),
        body: ListView.separated(
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Title'),
              subtitle: Text('Subtitle'),
              trailing: Icon(Icons.navigate_next),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Add'),
          icon: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.blur_circular),
              title: Text('Fridge'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flash_on),
              title: Text('Order'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
