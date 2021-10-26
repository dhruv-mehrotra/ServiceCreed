import 'package:service_creed/constants/app_colours.dart';
import 'package:service_creed/ui/views/feed_view/widgets/post_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAnswerWidget extends StatefulWidget {
  @override
  _AddAnswerWidgetState createState() => _AddAnswerWidgetState();
}

class _AddAnswerWidgetState extends State<AddAnswerWidget> {
  final _formKey = GlobalKey<FormState>();
  String answer = '';

  @override
  Widget build(BuildContext context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Answer',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: primaryTextColor),
                ),
                SizedBox(height: 8.h),
                PostFormWidget(
                  onChangedQuestion: (answer) =>
                      setState(() => this.answer = answer),
                  onSavedPost: _addAnswer,
                ),
              ],
            ),
          ),
        ),
      );

  void _addAnswer() {}
}
