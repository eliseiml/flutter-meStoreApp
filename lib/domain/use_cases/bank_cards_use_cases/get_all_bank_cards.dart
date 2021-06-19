import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/domain/repositories/bank_card_repository.dart';

class GetAllBankCards {
  final BankCardRepository repository;

  GetAllBankCards(this.repository);

  Future<List<BankCard>> call() async {
    return await repository.getAllBankCards();
  }
}
