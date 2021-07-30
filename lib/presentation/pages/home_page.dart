//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/domain/entities/payment_system.dart';
import 'package:flutter_mestore_app/generated/l10n.dart';
import 'package:flutter_mestore_app/presentation/pages/card_editor_page.dart';
import 'package:flutter_mestore_app/presentation/widgets/app_bar.dart';
import 'package:flutter_mestore_app/presentation/widgets/bank_card.dart';
import 'package:flutter_mestore_app/presentation/widgets/bottom_bar.dart';
import 'package:flutter_mestore_app/presentation/widgets/custom_icon_button.dart';
import 'package:flutter_mestore_app/utils/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  Widget exampleCard(BuildContext context) {
    return BankCardView(
      card: BankCard(
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
      screenWidth: MediaQuery.of(context).size.width,
    );
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
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              exampleCard(context),
              exampleCard(context),
              exampleCard(context),
              exampleCard(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset('assets/icons/addicon.png', height: 30),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CardEditorPage(card: BankCard.blankCard());
          }));
        },
        backgroundColor: MeStoreBasicColors.geyser,
      ),
      bottomNavigationBar: BottomTabBar(
        onChanged: (val) {},
      ),
    );
  }
}
