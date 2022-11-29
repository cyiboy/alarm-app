import 'package:alarm_reminder/model/reminder_model.dart';
import 'package:hive/hive.dart';

abstract class BaseLocalStorageRepository {
  Future<Box> OpenBox();
  List<Reminder> getAll(Box box);
  Future<void > addReminder(Box box, Reminder reminder);
  Future<void > removeProductFromCart(Box box, Reminder reminder);


  Future<void> clearData(Box box);
}

class ReminderData extends BaseLocalStorageRepository{
  String boxName = 'ReminderData';

  @override
  Future<Box> OpenBox() async {
    Box box = await Hive.openBox<Reminder>(boxName);
    return box;
  }

  @override
  Future<void> addReminder(Box box, Reminder reminder) async {
    await box.put(reminder.desc, reminder);
  }

  @override
  Future<void> clearData(Box box) async {

    await box.clear();
  }

  @override
  List<Reminder> getAll(Box box) {
    // TODO: implement getAll
    return box.values.toList() as List<Reminder>;
  }

  @override
  Future<void> removeProductFromCart(Box box, Reminder reminder) async {
    // TODO: implement removeProductFromCart
    await box.delete(reminder.desc);
  }

}