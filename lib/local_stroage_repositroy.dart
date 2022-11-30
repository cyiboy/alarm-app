import 'package:alarm_reminder/model/reminder_model.dart';
import 'package:hive/hive.dart';

abstract class BaseLocalStorageRepository {
  Future<Box> OpenBox();
  Future<Box> OpenSaveBox();
  List getSaveAll(Box box);
  List<Reminder> getAll(Box box);
  Future<void > addSave(Box box, String head, String body);

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

  @override
  Future<Box> OpenSaveBox() async {
    Box box = await Hive.openBox('saved');
    return box;
  }

  @override
  Future<void> addSave(Box box, String head, String body) async {
    await box.put(head,  {
        "head":head,
        "body":body
    });
  }

  @override
  List getSaveAll(Box box) {
    return box.values.toList();
  }

}