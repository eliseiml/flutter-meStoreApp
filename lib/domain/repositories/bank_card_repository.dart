import 'package:flutter_mestore_app/domain/entities/bank_card.dart';

abstract class BankCardRepository {
  Future<List<BankCard>> getAllBankCards();
  Future<bool> addNewBankCard(BankCard newCard);
  Future<bool> changeBankCardData(
      {required BankCard oldCard, required BankCard newCard});
  Future<bool> removeBankCard(BankCard card);
}
