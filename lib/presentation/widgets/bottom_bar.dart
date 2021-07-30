import 'package:flutter/material.dart';
import 'package:flutter_mestore_app/utils/colors.dart';

///`BottomBarPosition` describes possible positions of the bottom tab bat
enum BottomBarPosition { Cards, Accounts }

/// The `BottomTabBar` provides the bottom tab bar
/// Its `onChanged` callback is used to inform the outside world about
/// switching tabs. This function uses `BottomBarPosition` enum as a parameter
class BottomTabBar extends StatefulWidget {
  final Function(BottomBarPosition value) onChanged;
  BottomTabBar({required this.onChanged, Key? key}) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState(onChanged);
}

class _BottomTabBarState extends State<BottomTabBar> {
  final Function(BottomBarPosition value) onChanged;
  BottomBarPosition value = BottomBarPosition.Cards;
  _BottomTabBarState(this.onChanged);

  @override
  Widget build(BuildContext context) {
    double indicatorWidth = (MediaQuery.of(context).size.width - 96) / 2;
    //left ofsset for the first indicator position
    double firstPosOffset = 24;
    //left offset for the second insicator position
    double secondPosOffset = 3 * 24 + indicatorWidth;
    return Container(
      height: 65,
      color: MeStoreBasicColors.geyser,
      //alignment: Alignment.topCenter,
      child: Stack(
        //alignment: Alignment.topCenter,
        children: [
          //Icons
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Cards tab
                GestureDetector(
                  onTap: () {
                    setState(() {
                      value = BottomBarPosition.Cards;
                    });
                    onChanged(value);
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                      height: 32,
                      width: indicatorWidth,
                      child: Image.asset('assets/icons/cardicon.png')),
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: MeStoreBasicColors.tabSeparatorColor,
                ),
                //Accounts tab
                GestureDetector(
                    onTap: () {
                      setState(() {
                        value = BottomBarPosition.Accounts;
                      });
                      onChanged(value);
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                        height: 23,
                        width: indicatorWidth,
                        child: Image.asset('assets/icons/keyicon.png'))),
              ],
            ),
          ),
          //Animated indicator
          AnimatedPositioned(
            child: Container(
              color: MeStoreBasicColors.rhino,
            ),
            duration: Duration(milliseconds: 200),
            height: 3,
            width: indicatorWidth,
            left: value == BottomBarPosition.Cards
                ? firstPosOffset
                : secondPosOffset,
            bottom: 10,
          )
        ],
      ),
    );
  }
}
