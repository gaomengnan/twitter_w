import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_w/core/core.dart';

// providers

final authApiProvider = Provider((ref) {
  return AuthApi(
    account: ref.watch(appwriteAccountProvier),
  );
});

abstract class IAuthApi {
  FutureEither<model.User> signup({
    required String email,
    required String password,
  });
}

class AuthApi implements IAuthApi {
  final Account _account;
  AuthApi({required Account account}) : _account = account;
  @override
  FutureEither<model.User> signup({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}
