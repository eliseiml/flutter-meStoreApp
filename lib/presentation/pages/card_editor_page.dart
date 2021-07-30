import 'package:flutter/material.dart';
import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/generated/l10n.dart';
import 'package:flutter_mestore_app/presentation/widgets/app_bar.dart';
import 'package:flutter_mestore_app/presentation/widgets/bank_card.dart';
import 'package:flutter_mestore_app/presentation/widgets/bottom_bar.dart';
import 'package:flutter_mestore_app/presentation/widgets/custom_icon_button.dart';

class CardEditorPage extends StatelessWidget {
  final BankCard card;
  const CardEditorPage({required this.card, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        text: S.of(context).EditCard,
        leading: customIconButton(
          context,
          iconPath: 'assets/icons/arrowback.png',
          height: 20,
          width: 30,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        trailing: customIconButton(
          context,
          iconPath: 'assets/icons/done.png',
          height: 17,
          width: 24,
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: BankCardView(
          card: card,
          screenWidth: MediaQuery.of(context).size.width,
        ),
      ),
      bottomNavigationBar: BottomTabBar(onChanged: (val) {}),
    );
  }
}
