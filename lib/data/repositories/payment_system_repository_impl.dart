import 'package:flutter_mestore_app/domain/entities/payment_system.dart';
import 'package:flutter_mestore_app/domain/repositories/payment_system_repository.dart';

class PaymentSystemRepositoryImpl implements PaymentSystemRepository {
  @override
  Future<PaymentSystem> getPaymentSystemByCardNumber(String cardNumber) async {
    return PaymentSystem(id: 0, name: 'name', logo: null);
  }
}
