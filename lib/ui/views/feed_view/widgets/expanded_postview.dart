import 'package:service_creed/constants/app_colours.dart';
import 'package:service_creed/models/post_model.dart';
import 'package:service_creed/ui/views/feed_view/widgets/feed_post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'add_answer_widget.dart';

class ExpandedPostviewWidget extends StatelessWidget {
  final Post post;

  ExpandedPostviewWidget(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RaisedButton(
        onPressed: () {
          showModalBottomSheet(
              enableDrag: true,
              isScrollControlled: true,
              context: context,
              builder: (context) => AddAnswerWidget(),
              isDismissible: true);
        },
        child: Text("Add Answer"),
      ),
      body: Container(
        padding: EdgeInsets.all(7.w),
        alignment: Alignment.center,
        child: ListView(
          children: [
            SizedBox(height: 27.28.h),
            RichText(
                text: TextSpan(
              text: post.question,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: primaryTextColor,
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
                    child: _expandedFeedAnswerCard("Default Mentor",
                        "The key is to overcome what's called functional fixedness. You look at that box and you see it only as a receptacle for the tacks. But it can also have this other function, as a platform for the candle. The candle problem."),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 23.82.h,
                );
              },
              itemCount: 3,
            )
          ],
        ),
      ),
    );
  }
}

Widget _expandedFeedAnswerCard(String mentorName, String answerText) {
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
                      child:
                      SvgPicture.asset('assets/icons/temporary_mentoricon.svg'),
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
                      maxLines: 100,
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
          ),
        ),

  );
}
