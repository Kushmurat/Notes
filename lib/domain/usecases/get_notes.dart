import '../entities/note.dart';
import '../repositories/note_repository.dart';

class GetNotes {
  final NoteRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call() async {
    final notes = await repository.getAllNotes();
    notes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return notes;
  }
}
