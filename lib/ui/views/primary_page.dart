import 'package:service_creed/constants/app_colours.dart';
import 'package:service_creed/models/firebase_user_model.dart';
import 'package:service_creed/ui/views/feed_view/feed_view.dart';
import 'package:service_creed/ui/views/myteam_view/smp_group.dart';
import 'package:service_creed/ui/views/saved_posts_view/saved_posts_view.dart';
import 'package:service_creed/ui/views/search_view/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'notifications_view/notifications_view.dart';

class PrimaryPage extends StatefulWidget {
  PrimaryPage({this.user});

  final FirebaseUser user;

  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int selectedIndex = 0;
  final List<Widget> children = [
    FeedView(),
    SearchWidget(),
    SavedPostsView(), //SavedQnsWidget(),
    NotificationsPageWidget(), //NotificationPageWidget(),
    SmpGroupWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.grey.withOpacity(1),
        selectedItemColor: primaryUiHighlightColor,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home_bottomnavbar.svg'),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon:
                SvgPicture.asset('assets/icons/search_bottomnavbar.svg'),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/saved_bottomnavbar.svg'),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/search_bottomnavbar.svg'),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/notifications_bottomnavbar.svg'),
            label: 'Team',
          ),
        ],
      ),
      body: children[selectedIndex],
    );
  }
}

Widget _buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24.sp, color: primaryTextColor),
      ),
    );
