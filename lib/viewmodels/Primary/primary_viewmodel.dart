import 'package:flutter/material.dart';
import 'package:service_creed/ui/views/ServicesPage/home_view.dart';
import 'package:service_creed/ui/views/myteam_view/smp_group.dart';
import 'package:service_creed/ui/views/notifications_view/notifications_view.dart';
import 'package:service_creed/ui/views/search_view/search_widget.dart';
import 'package:service_creed/viewmodels/base_viewmodel.dart';

class PrimaryViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  List<Widget> get pages => _pages;
  List<String> get titles => _titles;
  List<Color> get backGroundColor => _colors;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<Widget> _pages = <Widget>[
    HomeView(),
    SearchWidget(), //SavedQnsWidget(),
    NotificationsPageWidget(), //NotificationPageWidget(),
    SmpGroupWidget(),
  ];

  List<String> _titles = <String>[
    'Services',
    'Search',
    'Posts',
    'Notifications',
    'Smp',
  ];

  List<Color> _colors = <Color>[
    Colors.blue,
    Colors.red,
    Colors.green,
  ];
}
