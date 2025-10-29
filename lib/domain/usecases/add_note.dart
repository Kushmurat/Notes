import '../entities/note.dart';
import '../repositories/note_repository.dart';

class AddNote {
  final NoteRepository repository;

  AddNote(this.repository);

  Future<void> call(Note note) async {
    if (note.title.isEmpty && note.content.isEmpty) {
      throw Exception('Note is empty');
    }
    await repository.addNote(note);
  }
}
