// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../utils.dart';
import '../controllers/db_helper.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
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
                        dbHelper.addData(
                            titleController.text, descController.text);
                        showSnackbar('succesfully added data to hive database');
                        clearTextField();

                        Navigator.pop(context);
                        setState(() {});
                      },
                      labelText: 'Add Note',
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
