import 'package:flutter/material.dart';
import 'package:notes/presentation/pages/add_note_page.dart';

class NotesPage extends StatefulWidget {
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<Map<String, String>> notes = [
    {'title': 'Первая заметка', 'content': 'Пример текста'},
    {'title': 'Вторая заметка', 'content': 'Ещё текст'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мои заметки')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note['title']!),
            subtitle: Text(note['content']!),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddNotePage()),
          );

          if (newNote != null) {
            setState(() {
              notes.add(newNote);
            });
          }
        },
        child: const Icon(Icons.add),
      ),

    );
  }

}
