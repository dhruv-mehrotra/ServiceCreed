import 'package:service_creed/constants/app_colours.dart';
import 'package:service_creed/models/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'expanded_postview.dart';

class FeedPostCard extends StatelessWidget {
  final Post post;

  const FeedPostCard({
    @required this.post,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => buildPost(context);

  Widget buildPost(BuildContext context) => GestureDetector(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExpandedPostviewWidget(post)))
        },
        onLongPress: null,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.sp),
          ),
          elevation: 6.h,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
            child: Row(
              children: [
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.question,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryTextColor,
                          fontSize: 25.sp,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      _feedAnswerCard("Default Mentor",
                          "The key is to overcome what's called functional fixedness. You look at that box and you see it only as a receptacle for the tacks. But it can also have this other function, as a platform for the candle. The candle problem."),
                      SizedBox(height: 10.h),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(
                          DateFormat('yyyy-MM-dd – kk:mm')
                              .format(post.createdTime),
                          style: TextStyle(
                            color: primaryTextColor,
                            fontSize: 8,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

Widget _feedAnswerCard(String mentorName, String answerText) {
  return IntrinsicHeight(
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
              child: SvgPicture.asset('assets/icons/temporary_mentoricon.svg'),
            ),
            SizedBox(
              width: 7.w,
            ),
            RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: mentorName,
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
              maxLines: 2,
              text: TextSpan(
                text: answerText,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp,
                  color: primaryTextColor,
                ),
              )),
          SizedBox(
            height: 15.h,
          ),
        ]),
  );
}
