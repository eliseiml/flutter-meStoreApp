import 'package:flutter_mestore_app/domain/entities/bank_card.dart';

abstract class BankCardRepository {
  Future<List<BankCard>> getAllBankCards();
  Future<void> addNewBankCard(BankCard newCard);
  Future<void> changeBankCardData(
      {required BankCard oldCard, required BankCard newCard});
  Future<void> removeBankCard(BankCard card);
}
