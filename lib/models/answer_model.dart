import 'package:service_creed/services/utility_services.dart';
import 'package:flutter/cupertino.dart';

class Answer {
  @required
  String mentorId;
  @required
  DateTime answeredOn;
  @required
  String answer;
  @required
  int upvotes;

  Answer({
    this.mentorId,
    this.answeredOn,
    this.answer,
    this.upvotes,
  });

  static Answer fromJson(Map<String, dynamic> json) => Answer(
        answeredOn: Utils.toDateTime(json['answeredOn']),
        answer: json['answer'],
        mentorId: json['mentorId'],
        upvotes: json['upvotes'],
      );

  Map<String, dynamic> toJson() => {
        'answeredOn': Utils.fromDateTimeToJson(answeredOn),
        'answer': answer,
        'mentorId': mentorId,
        'upvotes': upvotes,
      };
}
