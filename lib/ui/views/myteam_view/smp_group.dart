import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_creed/constants/app_colours.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/ui/views/notifications_view/notifications_view.dart';
import 'package:service_creed/viewmodels/smp_group/smp_group_viewmodel.dart';

class SmpGroupWidget extends StatefulWidget {
  @override
  _SmpGroupWidgetState createState() => _SmpGroupWidgetState();
}

class _SmpGroupWidgetState extends State<SmpGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SmpGroupModel>(
        builder: (context, model, child) => Scaffold(
                body: Container(
              padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
              alignment: Alignment.center,
              child: ListView(children: [
                new SizedBox(
                  height: 8.h,
                ),
                RichText(
                  text: TextSpan(
                      text: "My Team",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: primaryTextColor,
                          fontSize: 32.sp)),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 82.h,
                      width: 82.w,
                      child: Container(),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 130.w,
                      height: 80.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                            text: "Default Mentor",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: primaryTextColor,
                            ),
                          )),
                          SizedBox(
                            height: 10.h,
                          ),
                          RichText(
                              text: TextSpan(
                            text: "1234567890",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: primaryTextColor,
                            ),
                          )),
                          SizedBox(
                            height: 10.h,
                          ),
                          RichText(
                              text: TextSpan(
                            text: "Email Id",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,
                              color: primaryTextColor,
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                SizedBox(
                  height: 100.h,
                  width: double.infinity,
                  child: RichText(
                      text: TextSpan(
                    text: "\tTeam member 1 - 1234567890 "
                        "\n\tTeam member 2 - 1234567890 "
                        "\n\tTeam member 3 - 1234567890 "
                        "\n\tTeam member 4 - 1234567890 "
                        "\n\tTeam member 5 - 1234567890",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: primaryTextColor,
                    ),
                  )),
                ),
                SizedBox(
                  height: 22.h,
                ),
                RichText(
                  text: TextSpan(
                      text: "Upcoming meet-",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primaryTextColor,
                          fontSize: 18.sp)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  height: 44.h,
                  width: 340.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  child: meetNotificationCard("06/07/21", "7:00 pm"),
                ),
                SizedBox(
                  height: 6.h,
                ),
                RichText(
                  text: TextSpan(
                      text: "Previous meets-",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primaryTextColor,
                          fontSize: 18.sp)),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
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
                  itemCount: 4,
                )
              ]),
            )));
  }
}
