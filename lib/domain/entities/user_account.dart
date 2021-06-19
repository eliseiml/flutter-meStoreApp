class UserAccount {
  final String name;
  final bool isFavorite;
  Map<String, dynamic> relatedData;

  UserAccount(
      {required this.name,
      required this.isFavorite,
      required this.relatedData});
}
