class MemberModel{
  dynamic title;
  dynamic id;
  MemberModel({
    required this.title,
    required this.id
});

  static final types = <MemberModel>[
    MemberModel(title: 'Member', id: 1),
    MemberModel(title: 'General', id: 2),
  ];
}