import 'package:flutter_mestore_app/domain/entities/user_account.dart';
import 'package:flutter_mestore_app/domain/repositories/user_account_repository.dart';

class UserAccountRepositoryImpl implements UserAccountRepository {
  @override
  Future<bool> addNewUserAccount(UserAccount newAccount) async {
    return false;
  }

  @override
  Future<bool> changeUserAccountData(
      {required UserAccount oldAccount,
      required UserAccount newAccount}) async {
    return false;
  }

  @override
  Future<List<UserAccount>> getAllUserAccounts() async {
    return [];
  }

  @override
  Future<bool> removeUserAccount(UserAccount userAccount) async {
    return false;
  }
}
