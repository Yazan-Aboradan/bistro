import '../values/app_strings.dart';

class Failure {
  final String? key;
  final String message; // Must be translated

  const Failure({
    this.key,
    this.message = AppStrings.failure,
  });
}

class ServerFailure extends Failure {
  ServerFailure({
    super.key,
    String? message,
  }) : super(
          message: message ?? AppStrings.serverFailure,
        );
}

class LocalFailure extends Failure {
  LocalFailure({
    super.key,
    String? message,
  }) : super(
          message: message ?? AppStrings.localFailure,
        );
}

class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure({
    String? message,
  }) : super(
          message: message ?? AppStrings.noInternetConnection,
        );
}

class SupportInformationFailure extends Failure {
  SupportInformationFailure({
    String? message,
  }) : super(
          message: message ?? AppStrings.supportInformation,
        );
}

class LocationFailure extends Failure {
  LocationFailure({
    String? message,
  }) : super(
          message: message ?? AppStrings.locationFailure,
        );
}
