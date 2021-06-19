import 'package:flutter_mestore_app/domain/entities/payment_system.dart';

class PaymentSystemModel extends PaymentSystem {
  PaymentSystemModel({
    required int id,
    required String name,
    required dynamic logo,
  }) : super(
          id: id,
          name: name,
          logo: logo,
        );
}
