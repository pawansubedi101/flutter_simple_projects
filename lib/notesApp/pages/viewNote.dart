// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_simple_projects/notesApp/controllers/db_helper.dart';
import 'package:flutter_simple_projects/notesApp/widgets/customButton.dart';
import 'package:flutter_simple_projects/notesApp/widgets/customTextField.dart';
import 'package:flutter_simple_projects/utils.dart';

class ViewNotePage extends StatefulWidget {
  const ViewNotePage(
      {super.key,
      required this.title,
      required this.description,
      required this.index});

  final String title;
  final String description;
  final int index;
  @override
  State<ViewNotePage> createState() => _ViewNotePageState();
}

class _ViewNotePageState extends State<ViewNotePage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();
  DbHelper dbHelper = DbHelper();

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
    titleController.text = widget.title;
    descController.text = widget.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(controller: titleController),
                    addGap(),
                    CustomTextField(controller: descController),
                    addGap(),
                    CustomButton(
                      onpress: () {
                        dbHelper.updateData(widget.index, titleController.text,
                            descController.text);
                        showSnackbar(
                            'succesfully Updated data into hive database');
                        clearTextField();
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      labelText: 'Update Note',
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
