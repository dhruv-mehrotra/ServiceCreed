import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ExpandedSeviceviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(7.w),
        alignment: Alignment.center,
        child: ListView(
          children: [
            SizedBox(height: 27.28.h),
            RichText(
                text: TextSpan(
              text: "",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: Colors.black,
              ),
            )),
            SizedBox(height: 15.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return IntrinsicHeight(
                  child: Container(
                    color: Colors.white,
                    width: 340.w,
                    child: _expandedServiceCard(),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 23.82.h,
                );
              },
              itemCount: 5,
            )
          ],
        ),
      ),
    );
  }
}

Widget _expandedServiceCard() {
  return IntrinsicHeight(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.sp),
      ),
      elevation: 4.h,
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 16.h,
              ),
              Row(children: [
                SizedBox(
                  height: 19.h,
                  width: 19.w,
                  child: Container(),
                ),
                SizedBox(
                  width: 7.w,
                ),
                RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: "",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                        color: Color(0xFF252423),
                      ),
                    )),
              ]),
              SizedBox(
                height: 9.4.h,
              ),
              RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 100,
                  text: TextSpan(
                    text: "",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  )),
              SizedBox(
                height: 15.h,
              ),
            ]),
      ),
    ),
  );
}
