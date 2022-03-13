import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool switchTheme = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Settings'),
              const SizedBox(height: 28),
              settingButton('assets/icons/profile_white.svg', 'Profile'),
              settingButton('assets/icons/account.svg', 'Account'),
              settingButton('assets/icons/interests.svg', 'Interests'),
              settingButton('assets/icons/notification.svg', 'Notifications'),
              settingDarkButton('assets/icons/darkmode.svg', 'Dark Mode'),
              settingButton('assets/icons/about.svg', 'Terms & Conditions'),
              settingButton('assets/icons/about.svg', 'About'),
              settingButton('assets/icons/logout.svg', 'Log Out'),
            ],
          )),
    );
  }

  InkWell settingDarkButton(String icon, String text) {
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
                    value: switchTheme,
                    activeToggleColor: Color(0xFF180E19),
                    inactiveToggleColor: Colors.white,
                    activeColor: Color(0xffFFFFFF),
                    inactiveColor: Color(0xFF909090),
                    onToggle: (v) {
                      setState(() {
                        switchTheme = v;
                      });
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

  InkWell settingButton(String icon, String text) {
    return InkWell(
      child: SizedBox(
        height: 46,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
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
                  const Icon(
                    Icons.navigate_next_outlined,
                    color: Color(0xff909090),
                  )
                ],
              ),
            ),
            SizedBox(
              child: Divider(
                indent: 25,
                endIndent: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
