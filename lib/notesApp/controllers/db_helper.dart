import 'package:flutter_simple_projects/notesApp/models/notemodel.dart';

import 'package:hive/hive.dart';

class DbHelper {
  Box box = Hive.box<NewNote>('notes');

  addData(String title, String description) async {
    await box.add(NewNote(title: title, description: description));
  }

  deleteData(int index) async {
    await box.deleteAt(index);
  }

  updateData(int index, String title, String description) {
    box.putAt(index, NewNote(title: title, description: description));
  }
}
