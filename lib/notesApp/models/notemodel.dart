import 'package:hive/hive.dart';

part 'notemodel.g.dart';

@HiveType(typeId: 1)
class NewNote {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  NewNote({this.title, this.description});
}
