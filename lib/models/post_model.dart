import 'package:service_creed/services/utility_services.dart';
import 'package:flutter/cupertino.dart';

import 'answer_model.dart';

class PostField {
  static const createdTime = 'createdTime';
}

class Post {
  DateTime createdTime;
  String question;
  String id;
  List<Answer> answers;

  Post(
      {@required this.createdTime,
      @required this.question,
      this.id,
      this.answers});

  static Post fromJson(Map<String, dynamic> json) => Post(
        createdTime: Utils.toDateTime(json['createdTime']),
        question: json['question'],
        id: json['id'],
        // TODO(Dhruv): add answers: json['answers']
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'question': question,
        'id': id,
        'answers': answers,
      };
}
