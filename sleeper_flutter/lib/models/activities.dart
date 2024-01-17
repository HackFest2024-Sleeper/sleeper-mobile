class Activity {
  final String name;
  final int priority;
  final int duration;
  final DateTime date;
  final String? time;

  Activity({
    required this.name,
    required this.priority,
    required this.duration,
    required this.date,
    required this.time,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      name: json['name'],
      priority: json['priority'],
      duration: json['duration'],
      date: json['date'],
      time: json['time'],
    );
  }
}
