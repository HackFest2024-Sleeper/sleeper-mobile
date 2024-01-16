class Activity {
  String desc;
  String time;
  int duration;
  int priority;
  Activity(this.desc, this.time, this.duration, this.priority);

  Map<String, dynamic> toJson() {
    return {
      'desc': desc,
      'time': time,
      'duration': duration,
      'priority': priority,
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
