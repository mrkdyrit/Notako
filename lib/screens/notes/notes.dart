import 'package:flutter/material.dart';
import 'package:notako_app/screens/notes/create_note.dart';
import 'package:notako_app/widgets/help/images/help_welcome_image_builder.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateNoteScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Test s')
      ),
    );
  }
}