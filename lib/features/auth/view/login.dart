import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_w/common/widgets/common.dart';
import 'package:twitter_w/constants/constants.dart';
import 'package:twitter_w/features/auth/view/signup.dart';
import 'package:twitter_w/features/auth/widgets/auth_field.dart';
import 'package:twitter_w/theme/pallete.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();

  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
}

class _LoginViewState extends State<LoginView> {
  final appBar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _tapGestureRecognizer = TapGestureRecognizer();

  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tapGestureRecognizer.dispose();
    passwordController.dispose();
    emailController.dispose();
    _passwordFocus.dispose();
    _emailFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // input 1 email
                AuthField(
                  controller: emailController,
                  hintText: "email",
                  focusNode: _emailFocus,
                ),

                const SizedBox(height: 25),
                // input 2
                AuthField(
                  controller: passwordController,
                  hintText: "password",
                  focusNode: _passwordFocus,
                ),

                const SizedBox(
                  height: 40,
                ),
                // button
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                    onTap: () {},
                    label: "Done",
                    // backgroundColor: Pallete.backgroundColor,
                    // textColor: Pallete.whiteColor,
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    // style: TextStyle(color: Pallete.blueColor),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: _tapGestureRecognizer
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              SignUpView.route(),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                // textspan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
