class ServiceExceptions implements Exception {
  final String message;
  const ServiceExceptions([
    this.message = 'Something went wrong on the server',
  ]);
  @override
  String toString() => message;
}

class NetworkExceptions implements Exception {
  final String message;
  const NetworkExceptions([this.message = 'No internet']);
}

class UnknownExceptions implements Exception {
  final String message;
  const UnknownExceptions([this.message = 'An unknown error occurred']);
}

class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException([this.message = 'Invalid credentials']);
}
