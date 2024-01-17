class Activity {
  String name;
  int duration;
  int priority;
  DateTime date;
  String? time;
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
      date: DateTime.parse(json['date']),
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'duration': duration,
      'priority': priority,
      'time': time,
    };
  }
}

class UserActivitiesModel {
  String uid;
  String date;
  List<Activity> activities;
  UserActivitiesModel(this.uid, this.date, this.activities);

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'date': date,
      'activities': activities.map((activity) => activity.toJson()).toList(),
    };
  }
}
