import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bistro/app/core/storage/app_storage.dart';

final appStorageProvider = Provider.autoDispose<AppStorage>(
  (ref) {
    return AppStorage.getInstance();
  },
);
