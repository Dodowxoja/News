import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:home/core/constants/thema_const.dart';

class SettingDarkButtonWidget {
  static InkWell settingDarkButton(
      String icon, String text, Function _setstate) {
    return InkWell(
      child: SizedBox(
        height: 46,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(child: SvgPicture.asset(icon)),
                      const SizedBox(width: 10),
                      Text(text),
                    ],
                  ),
                  FlutterSwitch(
                    width: 40,
                    height: 25,
                    toggleSize: 18,
                    value: ThemaConst.switchTheme,
                    activeToggleColor: const Color(0xFF180E19),
                    inactiveToggleColor: Colors.white,
                    activeColor: const Color(0xffFFFFFF),
                    inactiveColor: const Color(0xFF909090),
                    onToggle: (v) {
                      _setstate(() => ThemaConst.switchTheme = v);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(child: Divider(indent: 25, endIndent: 0)),
          ],
        ),
      ),
    );
  }

  void setState(bool Function() param0) {}
}
