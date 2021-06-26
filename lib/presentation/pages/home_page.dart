//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/domain/entities/payment_system.dart';
import 'package:flutter_mestore_app/generated/l10n.dart';
import 'package:flutter_mestore_app/presentation/widgets/app_bar.dart';
import 'package:flutter_mestore_app/presentation/widgets/bank_card.dart';
import 'package:flutter_mestore_app/presentation/widgets/bottom_bar.dart';
import 'package:flutter_mestore_app/presentation/widgets/custom_icon_button.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  Widget exampleCard(BuildContext context) {
    return BankCardView(
        BankCard(
          id: 1,
          cardNumber: '1234567890123456',
          cardholderName: 'yelisei melnichuk',
          cardColor: Colors.deepPurple,
          bankName: 'BELARUSBANK',
          description: 'Salary card',
          expireDate: DateTime.now(),
          pinCode: '1234',
          cvv: '111',
          paymentSystem: PaymentSystem(id: 11, name: 'mastercard', logo: null),
        ),
        MediaQuery.of(context).size.width);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        text: S.of(context).Cards,
        leading: customIconButton(
          context,
          iconPath: 'assets/icons/hamburger.png',
          height: 12,
          width: 18,
        ),
        trailing: customIconButton(
          context,
          iconPath: 'assets/icons/settings.png',
          height: 26,
          width: 26,
        ),
      ),
      body: StackedCardCarousel(
        initialOffset: 20,
        spaceBetweenItems: 80,
        type: StackedCardCarouselType.cardsStack,
        items: [
          exampleCard(context),
          exampleCard(context),
          exampleCard(context),
          exampleCard(context)
        ],
      ),
      /* Container(
          child: ListView(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 24, right: 24),
        children: [
          Align(
              heightFactor: 0.4,
              alignment: Alignment.topCenter,
              child: exampleCard(context)),
          Align(
              heightFactor: 0.4,
              alignment: Alignment.topCenter,
              child: exampleCard(context)),
          Align(
              heightFactor: 0.4,
              alignment: Alignment.topCenter,
              child: exampleCard(context)),
          Align(
              heightFactor: 0.4,
              alignment: Alignment.topCenter,
              child: exampleCard(context)),
        ],
      )), */
      bottomNavigationBar: bottomBar(context),
    );
  }
}
