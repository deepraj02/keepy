import 'package:supabase_test_app/src/shared/constants.dart';

import 'inotes.service.dart';

class NotesServiceImpl implements INotesService {
  final supabase = ProjectConstants.supaInstance;
  @override
  Future<void> createNote(String note) async {
    await supabase.from('notes').insert({'body': note});
  }

  @override
  Future<void> deleteNote(String noteId) async {
    await supabase.from('notes').delete().eq('id', noteId);
  }

  @override
  Future<void> updateNote(String updatedNote, String noteId) async {
    await supabase.from('notes').update({'body': updatedNote}).eq('id', noteId);
  }
}
