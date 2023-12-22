// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_simple_projects/notesApp/controllers/db_helper.dart';

import 'package:flutter_simple_projects/notesApp/models/notemodel.dart';
import 'package:flutter_simple_projects/notesApp/pages/addNote.dart';
import 'package:flutter_simple_projects/notesApp/pages/viewNote.dart';

// import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/customListTile.dart';

class NoteHomePage extends StatefulWidget {
  const NoteHomePage({super.key});

  @override
  State<NoteHomePage> createState() => _NoteHomePageState();
}

class _NoteHomePageState extends State<NoteHomePage> {
  late List<NewNote> data = [];
  DbHelper dbHelper = DbHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  getAllData() async {
    final box = Hive.box<NewNote>('notes');
    setState(() {
      data = box.values.toList();
      print('successfully retrieved data from database');
    });
  }

  showSnackbar(String message) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  clearTextField() {
    titleController.clear();
    descController.clear();
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getAllData();

    // data = box.values.toList() as List<NewNote>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: (data.isEmpty)
                  ? const Text('No notes found')
                  : Expanded(
                      child: ValueListenableBuilder(
                          valueListenable:
                              Hive.box<NewNote>('notes').listenable(),
                          builder: ((
                            context,
                            value,
                            child,
                          ) {
                            List<NewNote> notes = value.values.toList();
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: notes.length,
                                itemBuilder: (BuildContext context, index) {
                                  final title = notes[index].title.toString();
                                  final description =
                                      notes[index].description.toString();
                                  return CustomListtile(
                                    index: index,
                                    title: title,
                                    description: description,
                                    onLongpress: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return ViewNotePage(
                                          index: index,
                                          title: title,
                                          description: description,
                                        );
                                      }));
                                    },
                                    onpress: () {
                                      // dbHelper.deleteData(index);
                                      setState(() {});

                                      showSnackbar(
                                          'successfully removed data at $index');
                                    },
                                  );
                                });
                          }),
                          child: const Text('fsdfsd'))))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const AddNotePage())))
                .whenComplete(() {
              setState(() {});
            });
          }),
    );
  }
}
