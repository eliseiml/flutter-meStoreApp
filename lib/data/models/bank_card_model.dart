import 'package:flutter/material.dart';
import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/domain/entities/payment_system.dart';

class BankCardModel extends BankCard {
  BankCardModel(
      {required int id,
      required String bankName,
      required String description,
      required String cardNumber,
      required String cardholderName,
      required DateTime expireDate,
      required String pinCode,
      required String cvv,
      required PaymentSystem paymentSystem,
      required Color cardColor})
      : super(
            id: id,
            bankName: bankName,
            description: description,
            cardNumber: cardNumber,
            cardholderName: cardholderName,
            expireDate: expireDate,
            pinCode: pinCode,
            cvv: cvv,
            paymentSystem: paymentSystem,
            cardColor: cardColor);

  factory BankCardModel.fromMap(Map<String, dynamic> map) {
    return BankCardModel(
        id: map['id'],
        bankName: map['bankName'],
        description: map['description'],
        cardNumber: map['cardNumber'],
        cardholderName: map['cardholderName'],
        expireDate: DateTime.parse(map['expireDate']), //is it safe?
        pinCode: map['pinCode'],
        cvv: map['cvv'],
        paymentSystem:
            PaymentSystem(id: 0, name: '', logo: null), //need to correct
        cardColor: Color(map['cardColor']));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id, //int
      'bankName': bankName, //str
      'description': description, //str
      'cardNumber': cardNumber, //str
      'cardholderName': cardholderName, //str
      'expireDate': expireDate.toString(), //str
      'pinCode': pinCode, //str
      'cvv': cvv, //str
      'paymentSystem': paymentSystem.id, //int
      'cardColor': cardColor.value //int
    };
  }
}
