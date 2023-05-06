import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class NotakoDBHelper {
  String currentUserId = FirebaseAuth.instance.currentUser!.uid; 

  Future<bool> createNote(String noteTitle, String noteContent, List<String> noteTags) async {
    bool saveStatus = true;

    DatabaseReference ref = FirebaseDatabase.instance.ref('notes/$currentUserId');
    // Gets the current date and time and assigns it as the ID of the note.
    String noteID = DateTime.now().toString().replaceAll(RegExp(r'\D'), '');

    ref.update({
      noteID: {
        'title': noteTitle,
        'tags': noteTags,
        'is_locked': false,
        'date_created': DateTime.now().toString(),
        'content': noteContent,
      }
    }).catchError((error) { saveStatus = false; });

    return saveStatus;
  }

  Stream getNotes() {
    return FirebaseDatabase.instance.ref('notes/$currentUserId').onValue;
  }
}