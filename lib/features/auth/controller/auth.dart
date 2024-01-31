import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_w/apis/auth.dart';
import 'package:twitter_w/core/core.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authApi: ref.watch(authApiProvider),
  );
});

class AuthController extends StateNotifier<bool> {
  final IAuthApi _authApi;
  AuthController({
    required IAuthApi authApi,
  })  : _authApi = authApi,
        super(false);

  void signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authApi.signup(
      email: email,
      password: password,
    );

    // state = false;
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        state = false;
      },
    );

    res.fold(
      (l) => showSnakebar(
        context,
        l.message,
      ),
      (r) => Println("name"),
    );
  }
}

// signup state

class SignUpState extends StateNotifier<bool> {
  SignUpState() : super(false);

  void toggle(String email, String password) {
    if (email != "" && password != "") {
      state = true;
    }else{
      state = false;
    }
  }
}

final signupProvider = StateNotifierProvider<SignUpState, bool>((ref) {
  return SignUpState();
});
