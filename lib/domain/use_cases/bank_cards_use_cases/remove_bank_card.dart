import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/domain/repositories/bank_card_repository.dart';

class RemoveBankCard {
  final BankCardRepository repository;

  RemoveBankCard(this.repository);

  Future<void> call(BankCard card) async {
    await repository.removeBankCard(card);
  }
}
