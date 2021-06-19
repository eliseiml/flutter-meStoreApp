import 'package:flutter/material.dart';
import 'package:flutter_mestore_app/domain/entities/payment_system.dart';

class BankCard {
  final int id;
  final String bankName;
  final String description;
  final String cardNumber;
  final String cardholderName;
  final DateTime expireDate;
  final String pinCode;
  final String cvv;
  final PaymentSystem paymentSystem;
  final Color cardColor;

  BankCard(
      {required this.id,
      required this.bankName,
      required this.description,
      required this.cardNumber,
      required this.cardholderName,
      required this.expireDate,
      required this.pinCode,
      required this.cvv,
      required this.paymentSystem,
      required this.cardColor});
}
