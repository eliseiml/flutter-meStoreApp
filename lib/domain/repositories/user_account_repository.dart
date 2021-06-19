import 'package:flutter_mestore_app/domain/entities/user_account.dart';

abstract class UserAccountRepository {
  Future<List<UserAccount>> getAllUserAccounts();
  Future<bool> addNewUserAccount(UserAccount newAccount);
  Future<bool> changeUserAccountData(
      {required UserAccount oldAccount, required UserAccount newAccount});
  Future<bool> removeUserAccount(UserAccount userAccount);
}
