import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test_app/src/features/auth/presentation/login.page.dart';
import 'package:supabase_test_app/src/features/auth/services/auth.service.dart';
import 'package:supabase_test_app/src/features/notes/services/notes.service.dart';
import 'package:supabase_test_app/src/settings/settings_controller.dart';
import 'package:supabase_test_app/src/shared/constants.dart';

class NotesPage extends StatefulWidget {
  static const routeName = '/Notes';
  const NotesPage({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NotesServiceImpl notesService = NotesServiceImpl();
  AuthServiceImpl authService = AuthServiceImpl();
  final TextEditingController noteController = TextEditingController();

  late final SupabaseStreamFilterBuilder noteStreamSubscription;

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    noteStreamSubscription =
        ProjectConstants.supaInstance.from('notes').stream(primaryKey: ['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () {
            setState(() {
              widget.settingsController.updateThemeMode(
                  widget.settingsController.themeMode == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light);
            });
          },
          icon: Icon(
            widget.settingsController.themeMode == ThemeMode.light
                ? Icons.dark_mode_rounded
                : Icons.light_mode_rounded,
          ),
        ),
        IconButton(
          onPressed: () {
            authService.signOut();
            if (!mounted) return;
            Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                    builder: (context) => LoginPage(
                          settingsController: widget.settingsController,
                        )));
          },
          icon: const Icon(
            Icons.logout_outlined,
          ),
        )
      ]),
      body: StreamBuilder(
          stream: noteStreamSubscription,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final notes = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final note = notes[index];
                return GestureDetector(
                  /// Delete Function
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Delete Note"),
                          actions: [
                            TextButton(
                              child: const Text("Delete"),
                              onPressed: () async {
                                await notesService
                                    .deleteNote(note['id'].toString());

                                setState(() {});
                                if (mounted) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },

                  /// update function
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Update Note"),
                          content: TextFormField(
                            controller: noteController,
                            decoration: const InputDecoration(
                              labelText: "Updated Note Body",
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text("Cancel"),
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  noteController.clear();
                                });
                              },
                            ),
                            TextButton(
                              child: const Text("Update"),
                              onPressed: () async {
                                await notesService.updateNote(
                                    noteController.text, note['id'].toString());

                                setState(() {
                                  noteController.clear();
                                });
                                if (mounted) {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ListTile(
                    title: Text(note['body']),
                  ),
                );
              },
              itemCount: notes.length,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Note"),
                content: TextFormField(
                  controller: noteController,
                  decoration: const InputDecoration(
                    labelText: "Note Name",
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        noteController.clear();
                      });
                    },
                  ),
                  TextButton(
                    child: const Text("Create"),
                    onPressed: () {
                      notesService.createNote(noteController.text);

                      setState(() {
                        noteController.clear();
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}
