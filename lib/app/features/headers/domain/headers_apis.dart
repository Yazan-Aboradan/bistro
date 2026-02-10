import 'package:bistro/app/core/values/constants/app_urls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HeadersApis {

  Future<AppSettings?> fetchSettings({String lang = 'ar'}) async {
    final uri = Uri.parse('${AppUrls.getWelcomingMessageUrl}?lang=$lang');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final decoded = utf8.decode(response.bodyBytes);
      final  data = jsonDecode(decoded);
      return AppSettings.fromJson(data);
    } else {
      print('❌ Failed to load settings: ${response.statusCode}');
      return null;
    }
  }
}

class AppSettings {
  final String welcomeMessage;

  AppSettings({required this.welcomeMessage});

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      welcomeMessage: json['welcome_message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'welcome_message': welcomeMessage,
    };
  }
}
