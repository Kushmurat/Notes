import '../entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getAllNotes();
  Future<void> addNote(Note note);
  Future<void> deleteNote(String id);
  Future<void> updateNote(Note note);
}
