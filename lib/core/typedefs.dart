import 'package:dartz/dartz.dart';
import 'package:twitter_w/core/core.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureEitherVoid = FutureEither<void>;
