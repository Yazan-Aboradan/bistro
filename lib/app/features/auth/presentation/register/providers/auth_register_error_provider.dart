import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRegisterErrorProvider =
StateProvider.family<String?, String>((ref, field) => null);
