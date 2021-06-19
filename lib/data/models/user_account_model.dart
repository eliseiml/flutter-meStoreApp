import 'package:flutter_mestore_app/domain/entities/user_account.dart';

class UserAccountModel extends UserAccount {
  UserAccountModel(
      {required String name,
      required bool isFavorite,
      required Map<String, dynamic> relatedData})
      : super(name: name, isFavorite: isFavorite, relatedData: relatedData);
}
