import '../values/app_strings.dart';

class ServerException implements Exception {
  final String? key;
  final dynamic message;

  ServerException({
    this.key,
    this.message,
  });

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return AppStrings.serverException;
    return message.toString();
  }
}

class LocalException implements Exception {
  final String? key;
  final dynamic message;

  LocalException({
    this.key,
    this.message,
  });

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return AppStrings.localException;
    return message.toString();
  }
}
