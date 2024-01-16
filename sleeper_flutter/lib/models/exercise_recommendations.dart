import "package:sleeper_flutter/models/exercises.dart";

class ExerciseRecommendation {
  final int id;
  final int userId;
  final DateTime date;
  final Exercise exercise;

  ExerciseRecommendation({
    required this.id,
    required this.userId,
    required this.date,
    required this.exercise,
  });

  factory ExerciseRecommendation.fromJson(Map<String, dynamic> json) {
    return ExerciseRecommendation(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      exercise: Exercise.fromJson(json['Exercise']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'Exercise': exercise.toJson(),
    };
  }
}
