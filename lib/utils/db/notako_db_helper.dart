import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class NotakoDBHelper {
  String? getUserId = FirebaseAuth.instance.currentUser?.uid;

  String? createNote(String noteTitle, String noteContent, List<String>? noteTags) {
    DatabaseReference newNoteRef = FirebaseDatabase.instance.ref('notes/$getUserId').push();

    newNoteRef.set({
      'title': noteTitle,
      'tags': noteTags,
      'is_locked': false,
      'date_created': DateTime.now().toString(),
      'content': noteContent,
    });

    return newNoteRef.key;
  }

  void updateNote(String noteId, String noteTitle, String noteContent, List<String>? noteTags, bool isLocked) {
    DatabaseReference editNoteRef = FirebaseDatabase.instance.ref('notes/$getUserId/$noteId');

    editNoteRef.update({
      'title': noteTitle,
      'tags': noteTags,
      'is_locked': isLocked,
      'content': noteContent,
      'date_created': DateTime.now().toString(),
    });
  }

  void deleteNote(String noteId, String node) {
    DatabaseReference deleteNoteRef = FirebaseDatabase.instance.ref('$node/$getUserId/$noteId');

    deleteNoteRef.remove();
  }

  void moveToTrash(String noteId) {
    getNoteDetails(noteId).listen((event) {
      if(event.snapshot.value != null) {
        DatabaseReference movedToTrashRef = FirebaseDatabase.instance.ref('trash/$getUserId').push();

        movedToTrashRef.update({
          'title': event.snapshot.value['title'],
          'tags': event.snapshot.value['tags'] ?? [],
          'is_locked': event.snapshot.value['is_locked'],
          'content': event.snapshot.value['content'],
          'date_created': event.snapshot.value['date_created'],
        });

        deleteNote(noteId, 'notes');
      }
    });
  }

  void restoreTrash(String noteId) {
    getTrashNoteDetails(noteId).listen((event) {
      if(event.snapshot.value != null) {
        DatabaseReference movedToTrashRef = FirebaseDatabase.instance.ref('notes/$getUserId').push();

        movedToTrashRef.update({
          'title': event.snapshot.value['title'],
          'tags': event.snapshot.value['tags'] ?? [],
          'is_locked': event.snapshot.value['is_locked'],
          'content': event.snapshot.value['content'],
          'date_created': event.snapshot.value['date_created'],
        });

        deleteNote(noteId, 'trash');
      }
    });
  }

  Stream getNoteDetails(String noteId) {
    return FirebaseDatabase.instance.ref('notes/$getUserId/').child(noteId).onValue;
  }

  Stream getTrashNoteDetails(String noteId) {
    return FirebaseDatabase.instance.ref('trash/$getUserId/').child(noteId).onValue;
  }

  Stream getNotes() {
    return FirebaseDatabase.instance.ref('notes/$getUserId').onValue;
  }

  Stream getTrashNotes() {
    return FirebaseDatabase.instance.ref('trash/$getUserId').onValue;
  }
}