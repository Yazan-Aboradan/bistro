import 'package:intl/intl.dart';

class User {
  final int? id;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final String gender;
  final String phoneNumber;
  final String countryCode;
  final String language;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.gender,
    required this.phoneNumber,
    required this.countryCode,
    required this.language,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        phoneNumber: json['phone_number'],
        firstName: json['first_name'],
        lastName: json['surname'],
        gender: json['gender'],
        countryCode: json['country_code'],
        birthday: DateTime.parse(json['birthday']),
        language: json['language'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'phone_number': phoneNumber,
        'first_name': firstName,
        'surname': lastName,
        'gender': gender,
        'country_code': countryCode,
        'birthday': DateFormat('yyyy-MM-dd').format(birthday),
        'language': language,
      };
}
