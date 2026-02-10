enum AppFailuresEnum {
  serverFailure(
    messageKey: 'serverFailure',
  ),
  localFailure(
    messageKey: 'localFailure',
  ),
  supportInformation(
    messageKey: 'supportInformation',
  ),
  noInternetConnection(
    messageKey: 'noInternetConnection',
  );

  final String messageKey;

  const AppFailuresEnum({
    required this.messageKey,
  });
}
