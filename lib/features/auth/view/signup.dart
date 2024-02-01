import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_w/common/widgets/rounded_small_button.dart';
import 'package:twitter_w/constants/constants.dart';
import 'package:twitter_w/features/auth/controller/auth.dart';
import 'package:twitter_w/features/auth/view/login.dart';
import 'package:twitter_w/features/auth/widgets/auth_field.dart';
import 'package:twitter_w/theme/pallete.dart';

RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();

  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appBar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _tapGestureRecognizer = TapGestureRecognizer();

  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  // SignUp
  void onSignUp() {
    ref.read(authControllerProvider.notifier).signup(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      ref.read(signupProvider.notifier).toggle(
            emailController.text,
            passwordController.text,
          );
    });
    passwordController.addListener(() {
      ref.read(signupProvider.notifier).toggle(
            emailController.text,
            passwordController.text,
          );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tapGestureRecognizer.dispose();
    emailController.dispose();
    passwordController.dispose();
    _passwordFocus.dispose();
    _emailFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(signupProvider);
    // print("isloading: $isLoading");
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // input 1 email
                AuthField(
                  controller: emailController,
                  focusNode: _emailFocus,
                  hintText: "email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Please enter a value";
                    }
                    if (!_emailRegex.hasMatch(val)) {
                      return 'Email address is not valid';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 25),
                // input 2
                AuthField(
                  focusNode: _passwordFocus,
                  controller: passwordController,
                  hintText: "password",
                ),

                const SizedBox(
                  height: 40,
                ),
                // button
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                    onTap: onSignUp,
                    label: "Done",
                    isLoading: isLoading,
                    // backgroundColor: Pallete.backgroundColor,
                    // textColor: Pallete.whiteColor,
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                RichText(
                  text: TextSpan(
                    text: "Already have a account?",
                    // style: TextStyle(color: Pallete.blueColor),
                    children: [
                      TextSpan(
                        text: " Login",
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: _tapGestureRecognizer
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              LoginView.route(),
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
