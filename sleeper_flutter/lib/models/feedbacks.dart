import 'package:sleeper_flutter/models/activities.dart';

class Feedback {
  final String feedback;
  final DateTime date;
  final Activity activity;

  Feedback({
    required this.feedback,
    required this.date,
    required this.activity,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
        feedback: json['feedback'],
        date: DateTime.parse(json['date']),
        activity: Activity.fromJson(json['Activity']));
  }

  Map<String, dynamic> toJson() {
    return {
      'feedback': feedback,
      'date': date.toIso8601String(),
    };
  }
}
