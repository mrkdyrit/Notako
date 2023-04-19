import 'package:flutter/material.dart';
import 'package:notako_app/screens/tags/tags_home_scaffold.dart';
import 'package:notako_app/screens/tags/tags_search_scaffold.dart';

class TagsScreen extends StatefulWidget {
  // final void Function(int) changeScreen;

  const TagsScreen({super.key});

  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {

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
  Widget build(BuildContext context) {
    if(isSearchMode) {
      return NoteTagSearch(goBack: toggleSearchMode, tagId: tagIdToBeSearched);
    } else {
      return NoteTagsHome(searchTag: toggleSearchMode,);
    }
  }
}