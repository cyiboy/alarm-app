import 'package:hive/hive.dart';
part 'reminder_model.g.dart';

@HiveType(typeId: 0)
class Reminder {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? desc;
  @HiveField(2)
  final List<dynamic>? date;
  @HiveField(3)
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

  Map<String, dynamic> toJson() =>
      {'title': title, 'desc': desc, 'date': date, 'time': time};
}
