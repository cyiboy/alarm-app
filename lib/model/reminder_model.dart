class Reminder {
  final String? title;
  final String? desc;
  final List<dynamic>? date;
  final List<dynamic>? time;

  Reminder({
    this.title,
    this.desc,
    this.date,
    this.time,
  });

  Reminder.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        desc = json['desc'] as String?,
        date = json['date'] as List?,
        time = json['time'] as List?;

  Map<String, dynamic> toJson() => {
    'title' : title,
    'desc' : desc,
    'date' : date,
    'time' : time
  };
}