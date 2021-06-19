import 'package:flutter_mestore_app/domain/entities/payment_system.dart';

abstract class PaymentSystemRepository {
  Future<PaymentSystem> getPaymentSystemByCardNumber(String cardNumber);
}
