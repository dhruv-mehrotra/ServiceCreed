import 'package:service_creed/constants/app_colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostFormWidget extends StatelessWidget {
  final String question;
  final ValueChanged<String> onChangedQuestion;
  final VoidCallback onSavedPost;

  const PostFormWidget({
    Key key,
    this.question = '',
    @required this.onChangedQuestion,
    @required this.onSavedPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  child: _buildQuestion(),
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                ),
                flex: 3,
              ),
              Flexible(
                  child: Padding(
                    child: Column(children: [_buildButton()]),
                    padding: EdgeInsets.fromLTRB(8.w, 55.h, 0.h, 0.h),
                  ),
                  flex: 1),
            ]),
      );

  Widget _buildQuestion() => TextFormField(
        maxLines: 3,
        initialValue: question,
        style: TextStyle(color: primaryTextColor),
        onChanged: onChangedQuestion,
        validator: (question) {
          if (question.isEmpty) {
            return 'Field cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF979C9E),
            ),
          ),
          border: UnderlineInputBorder(),
          labelText: 'Response',
        ),
      );

  Widget _buildButton() => SizedBox(
        width: 120.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryUiHighlightColor,
          ),
          onPressed: onSavedPost,
          child: Text('Save'),
        ),
      );
}
