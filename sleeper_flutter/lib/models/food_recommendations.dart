// ignore_for_file: non_constant_identifier_names

import "package:sleeper_flutter/models/foods.dart";

class FoodRecommendation {
  final int id;
  final int userId;
  final DateTime date;
  final Food food;

  FoodRecommendation({
    required this.id,
    required this.userId,
    required this.date,
    required this.food,
  });

  factory FoodRecommendation.fromJson(Map<String, dynamic> json) {
    return FoodRecommendation(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      food: Food.fromJson(json['Food']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'food': food.toJson(),
    };
  }
}
