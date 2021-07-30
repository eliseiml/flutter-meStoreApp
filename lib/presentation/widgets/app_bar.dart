import 'package:flutter/material.dart';
import 'package:flutter_mestore_app/utils/colors.dart';
import 'package:flutter_mestore_app/utils/text_styles.dart';

PreferredSizeWidget appBar({
  required BuildContext context,
  required String text,
  required Widget leading,
  required Widget trailing,
}) {
  double top = MediaQuery.of(context).padding.top;
  return PreferredSize(
    preferredSize: Size.fromHeight(40 + top),
    child: Container(
      padding: EdgeInsets.only(top: top, left: 10, right: 10),
      alignment: Alignment.center,
      color: MeStoreBasicColors.geyser,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          Text(
            text,
            style: appBarTitle,
          ),
          trailing,
        ],
      ),
    ),
  );
}
