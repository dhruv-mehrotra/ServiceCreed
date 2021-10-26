import 'package:service_creed/constants/app_colours.dart';
import 'package:service_creed/models/answer_model.dart';
import 'package:service_creed/models/post_model.dart';
import 'package:service_creed/ui/views/feed_view/widgets/post_form.dart';
import 'package:service_creed/viewmodels/feed/feed_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../locator.dart';

class AddPostWidget extends StatefulWidget {
  @override
  _AddPostWidgetState createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  final _formKey = GlobalKey<FormState>();
  String question = '';
  List<Answer> answers = [];

  @override
  Widget build(BuildContext context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 17.w),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Question',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: primaryTextColor),
                ),
                SizedBox(height: 11.h),
                PostFormWidget(
                  onChangedQuestion: (question) =>
                      setState(() => this.question = question),
                  onSavedPost: _addPost,
                ),
              ],
            ),
          ),
        ),
      );

  void _addPost() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final post = Post(
          id: DateTime.now().toString(),
          question: question,
          createdTime: DateTime.now(),
          answers: []);

      final variable = locator<FeedViewModel>();
      variable.addPost(post);

      Navigator.of(context).pop();
    }
  }
}
