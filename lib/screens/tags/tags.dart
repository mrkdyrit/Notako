import 'package:flutter/material.dart';
import 'package:notako_app/screens/tags/tags_home_scaffold.dart';
import 'package:notako_app/screens/tags/tags_search_scaffold.dart';
import 'package:notako_app/utils/db/notako_db_helper.dart';

class TagsScreen extends StatefulWidget {
  // final void Function(int) changeScreen;

  const TagsScreen({super.key});

  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {

  Map tagList = {};

  bool isSearchMode = false;
  String tagIdToBeSearched = '';

  void toggleSearchMode(String? tagId) {
    setState(() {
      if(!isSearchMode) {
        isSearchMode = true;
        tagIdToBeSearched = tagId!;
      } else {
        isSearchMode = false;
        tagIdToBeSearched = '';
      }
    });
  }

  @override
  void initState() {
    
    NotakoDBHelper().getNotes().listen((event) {
      Map<dynamic, dynamic> notesMap = event.snapshot.value;
      List<dynamic> notesList = notesMap.values.toList();

      tagList.clear();

      for(var note in notesList) {
        if(note['tags'] != null && note['tags'].length != 0) {
          for(var tag in note['tags']) {
            if(tagList.containsKey(tag)) {
              tagList.update(tag, (value) => value += 1);
            } else {
              tagList.addEntries({tag: 1}.entries);
            }
          }
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(isSearchMode) {
      return NoteTagSearch(goBack: toggleSearchMode, tagId: tagIdToBeSearched,);
    } else {
      return NoteTagsHome(searchTag: toggleSearchMode, tagList: tagList,);
    }
  }
}