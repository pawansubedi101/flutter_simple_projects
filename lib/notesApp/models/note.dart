class Note {
  String title;
  String description;
  Note({required this.title, required this.description});
}

List<Note> staticNotes = [
  Note(
      title: 'This is static note title',
      description: 'This is static note description'),
  Note(title: "static note 1", description: 'static note description 1'),
];
