import 'package:service_creed/constants/app_colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddMeetWidget extends StatefulWidget {
  @override
  _AddMeetWidgetState createState() => _AddMeetWidgetState();
}

class _AddMeetWidgetState extends State<AddMeetWidget> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Meet',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: primaryTextColor),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      );

  void _addAnswer() {}
}
