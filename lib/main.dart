import 'package:flutter/material.dart';
import 'package:notes/presentation/pages/add_note_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotesPage(),
    );
  }
}

class NotesPage extends StatelessWidget {
  final List<Map<String, String>> notes = [
    {'title': 'Первая заметка', 'content': 'Текст заметки'},
    {'title': 'Вторая заметка', 'content': 'Ещё одна'},
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

        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
