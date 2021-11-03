import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_creed/constants/app_colours.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/ui/views/notifications_view/widgets/add_meet_widget.dart';
import 'package:service_creed/viewmodels/smp_group/smp_group_viewmodel.dart';

class NotificationsPageWidget extends StatefulWidget {
  @override
  _NotificationsPageWidgetState createState() =>
      _NotificationsPageWidgetState();
}

class _NotificationsPageWidgetState extends State<NotificationsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SmpGroupModel>(
        builder: (context, model, child) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: primaryUiHighlightColor,
              onPressed: () => showModalBottomSheet(
                  enableDrag: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => AddMeetWidget(),
                  isDismissible: true),
              child: Icon(Icons.add),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
              alignment: Alignment.center,
              child: ListView(children: [
                new SizedBox(
                  height: 8.h,
                ),
                RichText(
                  text: TextSpan(
                      text: "Notifications",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: primaryTextColor,
                          fontSize: 32.sp)),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 44.h,
                      width: 340.w,
                      child: meetNotificationCard("06/07/21", "7:00 pm"),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 5.h,
                    );
                  },
                  itemCount: 6,
                ),
              ]),
            )));
  }
}

Widget notificationCard(String text1, String text2) {
  SizedBox(
    height: 44.h,
    width: 340.w,
    child: Center(
      child: Column(children: [
        RichText(
            text: TextSpan(
          text: text1,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: primaryTextColor,
          ),
        ))
      ]),
    ),
  );
}

Widget meetNotificationCard(String date, String time) {
  return SizedBox(
    height: 44.h,
    width: 340.w,
    child: Row(children: [
      SizedBox(
        width: 5,
      ),
      RichText(
          text: TextSpan(
        text: 'Topic',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: primaryTextColor,
        ),
      )),
      SizedBox(
        width: 20,
      ),
      Container(
          height: 15.h,
          width: 16.w,
          child: Container()),
      RichText(
          text: TextSpan(
        text: date,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: primaryTextColor,
        ),
      )),
      SizedBox(
        width: 20,
      ),
      Container(
          height: 16.h,
          width: 16.w,
          child: Container()),
      RichText(
          text: TextSpan(
        text: time,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: primaryTextColor,
        ),
      )),
    ]),
  );
}
