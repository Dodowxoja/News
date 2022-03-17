import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/core/constants/color_const.dart';
import 'package:home/core/constants/text_contreoller_const.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 120,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BackButton(color: ColorConst.color1),
            Text(
              'Profile',
              style: TextStyle(
                color: ColorConst.color1,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('SAVE'),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: 387,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              width: 94,
              height: 127,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    height: 70.5,
                    child: SvgPicture.asset('assets/icons/profile_black.svg'),
                  ),
                  const Text(
                    'Change picture',
                    style: TextStyle(fontSize: 12.5),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 210,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 20),
                      Text('@${TextControllerConst.userController.text}')
                    ],
                  ),
                  SizedBox(
                    height: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Link Accounts',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/facebook_16.svg'),
                            SizedBox(width: 11),
                            const Text('Facebook'),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/twitter_16.svg'),
                            SizedBox(width: 11),
                            const Text('Twitter'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
