import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home/core/components/divider.dart';
import 'package:home/core/components/sign_in_icons.dart';
import 'package:home/core/constants/color_const.dart';
import 'package:home/core/constants/keys_const.dart';
import 'package:home/core/constants/text_contreoller_const.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool nextPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 46),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/images/title.svg'),
              Form(
                key: KeyConst.formKey,
                child: Column(
                  children: [
                    textFormField(
                        'Username', TextControllerConst.userController),
                    textFormField('Email', TextControllerConst.emailController),
                    textFormField(
                        'Password', TextControllerConst.passController),
                  ],
                ),
              ),
              InkWell(
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorConst.color2,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: ColorConst.color3),
                  ),
                ),
                onTap: () {
                  if (nextPage == true) {
                    Navigator.pushReplacementNamed(context, '/');
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Dividers.divider(),
                  const Text('or sign in with'),
                  Dividers.divider(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SignInIcons.signInIcons(),
                  SignInIcons.signInIcons(),
                  SignInIcons.signInIcons(),
                  SignInIcons.signInIcons(),
                  SignInIcons.signInIcons(),
                ],
              ),
              SizedBox(
                height: 36,
                child: Column(
                  children: const [
                    Text(
                      'By signing up to News24 you are accepting our',
                      style: TextStyle(fontSize: 13),
                    ),
                    Text(
                      'Terms & Conditions',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField textFormField(String text, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: text),
      onChanged: (v) {
        ok();
      },
      validator: (v) {
        if (v!.isEmpty) {
          return "Bo'sh kiritish mumkin emas";
        }
      },
    );
  }

  ok() {
    if (KeyConst.formKey.currentState!.validate()) {
      ColorConst.color2 = const Color(0xff180E19);
      ColorConst.color3 = const Color(0xffEEEEEE);
      setState(() {
        nextPage = true;
      });
    } else {
      ColorConst.color3 = const Color(0xff180E19);
      ColorConst.color2 = const Color(0xffEEEEEE);
      setState(() {});
    }
  }
}
