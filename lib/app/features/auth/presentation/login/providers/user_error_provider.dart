import 'package:hooks_riverpod/hooks_riverpod.dart';

final userErrorProvider =
StateProvider.family<String?, String>((ref, field) => null);
