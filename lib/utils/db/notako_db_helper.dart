import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class NotakoDBHelper {
  String? getUserId = FirebaseAuth.instance.currentUser?.uid;

  Future<String?> createNote(String noteTitle, String noteContent, List<String>? noteTags, List<XFile> imageAttachments) async {
    DatabaseReference newNoteRef = FirebaseDatabase.instance.ref('notes/$getUserId').push();

    newNoteRef.set({
      'title': noteTitle,
      'tags': noteTags,
      'is_locked': false,
      'date_created': DateTime.now().toString(),
      'content': noteContent,
    });
    
    final connectivityResult = await Connectivity().checkConnectivity();

    // if(connectivityResult != ConnectivityResult.none && imageAttachments.isNotEmpty) {
      // for (var image in imageAttachments) {
      //   final storageRef = FirebaseStorage.instance.ref('${newNoteRef.path}/images/${image.name}');
      //   File imagePath = File(image.path);
      //   storageRef.putFile(imagePath).storage.toString();
      // }
    // }

    final appDir = await getApplicationDocumentsDirectory();

    if(imageAttachments.isNotEmpty) {
      for (var image in imageAttachments) {
        if(connectivityResult != ConnectivityResult.none) {
          final storageRef = FirebaseStorage.instance.ref('${newNoteRef.path}/images/${image.name}');
          File imagePath = File(image.path);
          storageRef.putFile(imagePath).storage.toString();
        }

        String imageFolder = '${appDir.path}/${newNoteRef.key}/images/';

        await Directory(imageFolder).create(recursive: true);
        
        image.saveTo('$imageFolder/${image.name}');
      }
    }

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