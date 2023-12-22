// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomListtile extends StatefulWidget {
  const CustomListtile({
    Key? key,
    required String title,
    required String description,
    required this.index,
    required this.onpress,
    required this.onLongpress,
  })  : _title = title,
        _description = description,
        super(key: key);

  final String _title;
  final String _description;
  final int index;
  final VoidCallback onpress;
  final VoidCallback onLongpress;

  @override
  State<CustomListtile> createState() => _CustomListtileState();
}

class _CustomListtileState extends State<CustomListtile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        onLongPress: widget.onLongpress,
        tileColor: Colors.blue.shade50,
        leading: CircleAvatar(
          child: Text('${widget.index + 1}'),
        ),
        title: Text(widget._title),
        subtitle: Text(widget._description),
        trailing: IconButton(
            onPressed: widget.onpress, icon: const Icon(Icons.delete)),
      ),
    );
  }
}
