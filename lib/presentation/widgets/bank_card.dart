import 'package:flutter/material.dart';
import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/generated/l10n.dart';
import 'package:flutter_mestore_app/utils/text_styles.dart';

class BankCardView extends StatefulWidget {
  final BankCard card;
  final double sw;
  const BankCardView(this.card, this.sw, {Key? key}) : super(key: key);

  @override
  _BankCardViewState createState() => _BankCardViewState(card, sw);
}

class _BankCardViewState extends State<BankCardView> {
  final BankCard card;
  double? screenWidth, cardHeight, cardWidth;
  _BankCardViewState(this.card, this.screenWidth);
  @override
  void initState() {
    super.initState();
    //screenWidth = MediaQuery.of(context).size.width;
    cardWidth = screenWidth! - 48;
    cardHeight = cardWidth! / 1.6;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: card.cardColor, borderRadius: BorderRadius.circular(12)),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          //logo
          Image.asset('assets/icons/mastercardlogo.png', height: 55),
          //data
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.description, style: bankCardData),
                Text(card.bankName, style: bankCardData),
                Text(
                    card.cardNumber.substring(0, 4) +
                        ' ' +
                        card.cardNumber.substring(4, 8) +
                        ' ' +
                        card.cardNumber.substring(8, 12) +
                        ' ' +
                        card.cardNumber.substring(12, 16),
                    style: bankCardData),
                Row(
                  children: [
                    Text(S.of(context).ValidThru.toUpperCase(),
                        style: bankCardValidThru),
                    Text(
                      ' ${card.expireDate.month}/${card.expireDate.year}',
                      style: bankCardData,
                    )
                  ],
                ),
                Text(card.cardholderName.toUpperCase(), style: bankCardData)
              ],
            ),
          )
        ],
      ),
    );
  }
}
