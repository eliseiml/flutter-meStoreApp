import 'package:flutter/material.dart';
import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import 'package:flutter_mestore_app/generated/l10n.dart';
import 'package:flutter_mestore_app/utils/colors.dart';
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
    cardWidth = screenWidth! - 48;
    cardHeight = cardWidth! / 1.6;
  }

  String _getExpireString(DateTime date) {
    String result = '';
    if (date.month < 10)
      result += '0${date.month}/';
    else
      result += '${date.month}/';
    result += date.year.toString().substring(2);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: cardHeight,
      width: cardWidth,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: card.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: black,
                offset: Offset(0, -5),
                blurRadius: 5,
                spreadRadius: 0),
          ]),
      child: Stack(
        alignment: Alignment.topRight,
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
                /* Row(
                  children: [
                    Text(card.description, style: bankCardData),
                    Spacer(),
                    Text(card.bankName, style: bankCardData),
                  ],
                ), */
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
                      ' ' + _getExpireString(card.expireDate),
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
