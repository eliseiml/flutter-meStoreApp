import 'package:flutter_mestore_app/data/data_constants.dart';
import 'package:flutter_mestore_app/data/models/bank_card_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class BankCardLocalDataSource {
  Future<List<BankCardModel>> getAllBankCards();
  Future<void> addNewBankCard(BankCardModel newCardModel);
  Future<void> changeBankCardData(
      {required BankCardModel oldCardModel,
      required BankCardModel newCardModel});
  Future<void> removeBankCard(BankCardModel card);
}

class BankCardLocalDataSourceImpl implements BankCardLocalDataSource {
  Database? dataBase;
  static const String cardsTable = 'bank_cards';

  Future<void> _openDBconnection() async {
    dataBase = await openDatabase(
      join(await getDatabasesPath(), bank_cards_database),
      onCreate: (db, version) => db.execute(
        'CREATE TABLE $cardsTable(' +
            'id INTEGER PRIMARY KEY, ' +
            'title TEXT, ' +
            'cardNumber TEXT, ' +
            'cardholderName TEXT, ' +
            'expireDate TEXT, ' +
            'pinCode TEXT, ' +
            'cvv TEXT, ' +
            'paymentSystem INTEGER, ' +
            'cardColor INTEGER)',
      ),
    );
  }

  @override
  Future<void> addNewBankCard(BankCardModel newCardModel) async {
    if (dataBase == null) await _openDBconnection();
    if (!dataBase!.isOpen) return;
    try {
      await dataBase!.insert(
        cardsTable,
        newCardModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.abort,
      );
    } on Exception catch (e) {
      print('Error while new card adding: $e');
    }
  }

  @override
  Future<void> changeBankCardData(
      {required BankCardModel oldCardModel,
      required BankCardModel newCardModel}) async {
    if (dataBase == null) await _openDBconnection();
    if (!dataBase!.isOpen) return;
    try {
      await dataBase!.update(cardsTable, newCardModel.toMap(),
          where: 'id = ?', whereArgs: [oldCardModel.id]);
    } on Exception catch (e) {
      print('Error while changing card: $e');
    }
  }

  @override
  Future<List<BankCardModel>> getAllBankCards() async {
    if (dataBase == null) await _openDBconnection();
    if (!dataBase!.isOpen) return [];
    List<Map<String, dynamic>> maps = [];
    List<BankCardModel> bankCardModels = [];
    try {
      maps = await dataBase!.query(cardsTable);
      bankCardModels = List.generate(
          maps.length, (index) => BankCardModel.fromMap(maps[index]));
    } on Exception catch (e) {
      print('Error while getting all cards: $e');
    }
    return bankCardModels;
  }

  @override
  Future<void> removeBankCard(BankCardModel card) async {
    if (dataBase == null) await _openDBconnection();
    if (!dataBase!.isOpen) return;
    try {
      await dataBase!.delete(
        cardsTable,
        where: 'id = ?',
        whereArgs: [card.id],
      );
    } on Exception catch (e) {
      print('Error while removing card: $e');
    }
  }
}
