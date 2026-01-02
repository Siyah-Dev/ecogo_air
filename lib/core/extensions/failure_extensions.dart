import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:exogo/core/errors/exceptions.dart';
import 'package:exogo/core/errors/failures.dart';

extension FailureHandling on Object {
  Either<Failure, T> toFailure<T>() {
    if (this is NetworkExceptions) {
      final raw = (this as NetworkExceptions).message;
      return Left(NetworkFailure(_mapNetworkError(raw)));
    } else if (this is SocketException) {
      return Left(SocketFailure(_mapSocketError((this as SocketException).message)));
    } else if (this is UnauthorizedException) {
      return const Left(UnauthorizedFailure("You are not authorized. Please login again."));
    } else if (this is ServiceExceptions) {
      return const Left(ServerFailure("Server is unavailable. Please try again later."));
    } else if (this is UnknownExceptions) {
      return Left(UnknownFailure((this as UnknownExceptions).message));
    } else {
      return const Left(UnknownFailure("Unexpected error occurred. Please try again."));
    }
  }
}

String _mapNetworkError(String rawMessage) {
  if (rawMessage.contains("No route to host") || rawMessage.contains("SocketException")) {
    return "Unable to connect. Please check your internet connection.";
  } else if (rawMessage.contains("timeout")) {
    return "Connection timed out. Please try again.";
  } else if (rawMessage.contains("HandshakeException")) {
    return "Secure connection failed. Please try again later.";
  } else {
    return "Connection error. Please check your internet connection or try again.";
  }
}

String _mapSocketError(String rawMessage) {
  if (rawMessage.contains("No route to host") || rawMessage.contains("SocketException")) {
    return "Server not reachable. Please check your internet connection or try again later.";
  } else if (rawMessage.contains("timed out")) {
    return "Connection timed out. Please try again.";
  } else if (rawMessage.contains("Connection refused") || rawMessage.contains("OS Error")) {
    return "Unable to connect with server. Please check your internet connection or try again later.";
  } else {
    return "Unable to connect. Please check your internet connection or try again.";
  }
}
