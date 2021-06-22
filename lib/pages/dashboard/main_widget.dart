import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:safe_fax/pages/dashboard/tabs/fax_widget.dart';
import 'package:safe_fax/pages/dashboard/tabs/home_widget.dart';
import 'package:safe_fax/pages/dashboard/tabs/profile_widget.dart';
class MainWidget extends StatefulWidget {

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex=0;
    List<Widget> _widgetOptions = <Widget>[
     Home_Widget(),
     Fax_Widget(),
     Profile_Widget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(LineIcons.home,size: 28,),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.fax,size: 28,),
                label: 'FAX',
              ),
              BottomNavigationBarItem(
                icon: Icon(LineIcons.user,size: 28,),
                label: 'PROFILE',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
          body: _widgetOptions[_selectedIndex],
    ));
  }
}
