import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingButtonWidget {
  static InkWell settingButton(
      String icon, String text, BuildContext context, String routeName) {
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
            const SizedBox(child: Divider(indent: 25, endIndent: 0)),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
