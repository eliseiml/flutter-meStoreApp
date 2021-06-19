import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/domain/repositories/bank_card_repository.dart';

class AddNewBankCard {
  final BankCardRepository repository;

  AddNewBankCard(this.repository);

  Future<void> call(BankCard newCard) async {
    await repository.addNewBankCard(newCard);
  }
}
