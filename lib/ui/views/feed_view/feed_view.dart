import 'package:service_creed/constants/app_colours.dart';
import 'package:service_creed/locator.dart';
import 'package:service_creed/models/post_model.dart';
import 'package:service_creed/services/api/firebase_api.dart';
import 'package:service_creed/services/auth_service.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/ui/views/feed_view/widgets/feed_post_card.dart';
import 'package:service_creed/viewmodels/feed/feed_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/add_question_widget.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FeedViewModel>(
      builder: (context, model, child) => Scaffold(
        body: StreamBuilder<List<Post>>(
          stream: FirebaseApi.readPosts(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Text(
                    'Something Went Wrong, Please Try Again later',
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w600,
                        color: primaryTextColor),
                  );
                } else {
                  final posts = snapshot.data;

                  final variable = locator<FeedViewModel>();
                  variable.setPosts(posts);
                  return Scaffold(
                    floatingActionButton: FloatingActionButton(
                      backgroundColor: primaryUiHighlightColor,
                      onPressed: () => showModalBottomSheet(
                          enableDrag: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => AddPostWidget(),
                          isDismissible: true),
                      child: Icon(Icons.add),
                    ),
                    body: ListView(children: [
                      SizedBox(
                        height: 21.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              SizedBox(
                                width: 21.w,
                              ),
                              Text("Feed",
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w700,
                                      color: primaryTextColor)),
                            ]),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  AuthService().signOut();
                                },
                                child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                      color: primaryTextColor, fontSize: 10.sp),
                                ),
                              ),
                            )
                          ]),
                      _feedPostListWidget(posts),
                    ]),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

Widget _feedPostListWidget(final posts) {
  return ListView.separated(
    shrinkWrap: true,
    itemCount: posts.length,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      final post = posts[index];
      return FeedPostCard(post: post);
    },
    separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 14.h);
    },
  );
}
