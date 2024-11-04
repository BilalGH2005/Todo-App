import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String label;

  @HiveField(1)
  final String date;

  @HiveField(2)
  bool isChecked;

  Task({required this.label, required this.date, this.isChecked = false});
}
