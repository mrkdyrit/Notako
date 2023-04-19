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
  String tagToBeSearch = '';

  void toggleSearchMode(String? tagToBeSearched) {
    setState(() {
      // isSearchMode = !isSearchMode;
      // tagToBeSearch = tagToBeSearched;
      if(!isSearchMode) {
        isSearchMode = true;
        tagToBeSearch = tagToBeSearched!;
      } else {
        isSearchMode = false;
        tagToBeSearch = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if(isSearchMode) {
      return tagSearchScaffold(screenWidth: screenWidth, tagToBeSearch: tagToBeSearch, context: context, changeMode: toggleSearchMode);
    } else {
      return tagsHomeScaffold(screenWidth: screenWidth, changeMode: toggleSearchMode);
    }
  }
}