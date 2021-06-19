import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/domain/repositories/bank_card_repository.dart';

class ChangeBankCardData {
  final BankCardRepository repository;

  ChangeBankCardData(this.repository);

  Future<void> call(BankCard oldCard, BankCard newCard) async {
    await repository.changeBankCardData(oldCard: oldCard, newCard: newCard);
  }
}
