import 'package:flutter_mestore_app/core/network_info.dart';
import 'package:flutter_mestore_app/data/local_data_sources/bank_card_local_data_source.dart';
import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/domain/repositories/bank_card_repository.dart';

class BankCardRepositoryImpl implements BankCardRepository {
  final BankCardLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BankCardRepositoryImpl({
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<void> addNewBankCard(BankCard newCard) async {}

  @override
  Future<void> changeBankCardData(
      {required BankCard oldCard, required BankCard newCard}) async {}

  @override
  Future<List<BankCard>> getAllBankCards() async {
    List<BankCard> cards = [];
    try {
      cards = await localDataSource.getAllBankCards();
    } on Exception catch (e) {
      print(e);
    }
    return cards;
  }

  @override
  Future<void> removeBankCard(BankCard card) async {}
}
