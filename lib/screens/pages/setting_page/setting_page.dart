import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:home/core/widgets/setting_button_widget.dart';
import 'package:home/core/widgets/setting_dark_button_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
              SettingButtonWidget.settingButton(
                'assets/icons/profile_white.svg',
                'Profile',
                context,
                '/setting_profile',
              ),
              SettingButtonWidget.settingButton(
                'assets/icons/account.svg',
                'Account',
                context,
                '/',
              ),
              SettingButtonWidget.settingButton(
                'assets/icons/interests.svg',
                'Interests',
                context,
                '/',
              ),
              SettingButtonWidget.settingButton(
                'assets/icons/notification.svg',
                'Notifications',
                context,
                '/',
              ),
              SettingDarkButtonWidget.settingDarkButton(
                  'assets/icons/darkmode.svg', 'Dark Mode', setState),
              SettingButtonWidget.settingButton(
                'assets/icons/about.svg',
                'Terms & Conditions',
                context,
                '/',
              ),
              SettingButtonWidget.settingButton(
                'assets/icons/about.svg',
                'About',
                context,
                '/',
              ),
              SettingButtonWidget.settingButton(
                'assets/icons/logout.svg',
                'Log Out',
                context,
                '/signin',
              ),
            ],
          )),
    );
  }
}
