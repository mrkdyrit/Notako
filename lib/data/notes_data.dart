class NotesData {
  List<Map<String, dynamic>> notes = [
    {
      'id': 'note_1',
      'title': 'Dummy Note',
      'tags': ['Test'],
      'is_locked': true,
      'date_created': 'Feb 15, 2023 10:44PM',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui massa, aliquam bibendum mattis eu, dictum nec nisi. Pellentesque porta erat nec orci vehicula pretium. Quisque tellus massa, pharetra venenatis tristique ac, maximus in eros. Donec ut tincidunt elit. Ut sed tempor ante, ac blandit nisl. In ac ultrices metus. Morbi vitae aliquam magna, ut tincidunt ipsum. Proin porttitor vehicula semper. Nulla a quam non mi convallis suscipit vitae non tortor.',
    },
    {
      'id': 'note_2',
      'title': 'Dummy Note 2',
      'tags': ['Sample', 'Custom', 'Tag'],
      'is_locked': false,
      'date_created': 'Feb 15, 2023 10:44PM',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui massa, aliquam bibendum mattis eu, dictum nec nisi. Pellentesque porta erat nec orci vehicula pretium. Quisque tellus massa, pharetra venenatis tristique ac, maximus in eros. Donec ut tincidunt elit. Ut sed tempor ante, ac blandit nisl. In ac ultrices metus. Morbi vitae aliquam magna, ut tincidunt ipsum. Proin porttitor vehicula semper. Nulla a quam non mi convallis suscipit vitae non tortor.',
    },
    {
      'id': 'note_3',
      'title': 'Dummy Note 3',
      'tags': ['Food', 'Work', 'School'],
      'is_locked': false,
      'date_created': 'Feb 15, 2023 10:44PM',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui massa, aliquam bibendum mattis eu, dictum nec nisi. Pellentesque porta erat nec orci vehicula pretium. Quisque tellus massa, pharetra venenatis tristique ac, maximus in eros. Donec ut tincidunt elit. Ut sed tempor ante, ac blandit nisl. In ac ultrices metus. Morbi vitae aliquam magna, ut tincidunt ipsum. Proin porttitor vehicula semper. Nulla a quam non mi convallis suscipit vitae non tortor.',
    },
    {
      'id': 'note_3',
      'title': 'Dummy Note 4',
      'tags': ['Food', 'Work', 'School'],
      'is_locked': false,
      'date_created': 'Feb 15, 2023 10:44PM',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui massa, aliquam bibendum mattis eu, dictum nec nisi. Pellentesque porta erat nec orci vehicula pretium. Quisque tellus massa, pharetra venenatis tristique ac, maximus in eros. Donec ut tincidunt elit. Ut sed tempor ante, ac blandit nisl. In ac ultrices metus. Morbi vitae aliquam magna, ut tincidunt ipsum. Proin porttitor vehicula semper. Nulla a quam non mi convallis suscipit vitae non tortor.',
    },
    {
      'id': 'note_4',
      'title': 'Dummy Note 5',
      'tags': ['Food', 'Work', 'School'],
      'is_locked': false,
      'date_created': 'Feb 15, 2023 10:44PM',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui massa, aliquam bibendum mattis eu, dictum nec nisi. Pellentesque porta erat nec orci vehicula pretium. Quisque tellus massa, pharetra venenatis tristique ac, maximus in eros. Donec ut tincidunt elit. Ut sed tempor ante, ac blandit nisl. In ac ultrices metus. Morbi vitae aliquam magna, ut tincidunt ipsum. Proin porttitor vehicula semper. Nulla a quam non mi convallis suscipit vitae non tortor.',
    },
    {
      'id': 'note_5',
      'title': 'Dummy Note 6',
      'tags': ['Food', 'Work', 'School'],
      'is_locked': false,
      'date_created': 'Feb 15, 2023 10:44PM',
      'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui massa, aliquam bibendum mattis eu, dictum nec nisi. Pellentesque porta erat nec orci vehicula pretium. Quisque tellus massa, pharetra venenatis tristique ac, maximus in eros. Donec ut tincidunt elit. Ut sed tempor ante, ac blandit nisl. In ac ultrices metus. Morbi vitae aliquam magna, ut tincidunt ipsum. Proin porttitor vehicula semper. Nulla a quam non mi convallis suscipit vitae non tortor.',
    }
  ];

  List<Map<String, dynamic>> getNotes() {
    return notes;
  }
}