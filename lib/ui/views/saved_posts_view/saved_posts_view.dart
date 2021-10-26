//TODO:(Dhruv) implement saved_posts_viewmodel once user.savedposts[] is availlable
//TODO:(Dhruv) ui to be same as feed_view page
import 'package:service_creed/constants/app_colours.dart';
import 'package:service_creed/locator.dart';
import 'package:service_creed/models/post_model.dart';
import 'package:service_creed/services/api/firebase_api.dart';
import 'package:service_creed/ui/views/base_view.dart';
import 'package:service_creed/ui/views/feed_view/widgets/feed_post_card.dart';
import 'package:service_creed/viewmodels/saved_posts/saved_posts_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedPostsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final variable = locator<SavedPostsViewModel>();
    final posts = variable.posts;

    return BaseView<SavedPostsViewModel>(
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
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: primaryTextColor),
                  );
                } else {
                  final posts = snapshot.data;

                  final variable = locator<SavedPostsViewModel>();
                  variable.setPosts(posts);
                  return Scaffold(
                    body: ListView(children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(children: [
                        SizedBox(
                          width: 4.w,
                        ),
                        Text("Saved",
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: primaryTextColor)),
                        SizedBox(
                          width: 230.w,
                        ),
                      ]),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: posts.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 12.h),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return FeedPostCard(post: post);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 12.3.h);
                        },
                      ),
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
