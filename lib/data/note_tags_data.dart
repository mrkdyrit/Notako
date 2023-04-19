class NoteTagsData {
  List<Map<String, dynamic>> noteTagData = [
    {
      'id': 'tag_1',
      'tag_name': 'Work',
      'note_count': 12,
    },
    {
      'id': 'tag_2',
      'tag_name': 'School',
      'note_count': 3,
    },
    {
      'id': 'tag_3',
      'tag_name': 'Food',
      'note_count': 7,
    },
    {
      'id': 'tag_4',
      'tag_name': 'Animals',
      'note_count': 49,
    },
    {
      'id': 'tag_5',
      'tag_name': 'Grocery',
      'note_count': 12,
    },
    {
      'id': 'tag_6',
      'tag_name': 'Anime',
      'note_count': 27
    },
    {
      'id': 'tag_7',
      'tag_name': 'Music',
      'note_count': 18
    }
  ];

  List getNoteTagsData() {
    return noteTagData;
  }
}