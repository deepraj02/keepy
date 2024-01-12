abstract class INotesService {
  Future<void> createNote(String note);
  Future<void> updateNote(String updatedNote, String noteId);
  Future<void> deleteNote(String noteId);
  
}
