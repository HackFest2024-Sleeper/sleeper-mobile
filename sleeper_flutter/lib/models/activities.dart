class Activity {
  final String name;
  final int priority;
  final int duration;
  final DateTime date;
  final String time;
  final int userId;

  Activity({
    required this.name,
    required this.priority,
    required this.duration,
    required this.date,
    required this.time,
    required this.userId,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      name: json['name'],
      priority: json['priority'],
      duration: json['duration'],
      date: DateTime.parse(json['date']),
      time: json['time'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'priority': priority,
      'duration': duration,
      'date': date.toIso8601String(),
      'time': time,
      'userId': userId,
    };
  }
}
