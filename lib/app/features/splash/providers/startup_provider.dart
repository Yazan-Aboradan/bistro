import 'package:bistro/app/core/storage/app_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Provides a Future that resolves when critical app initialization is done
final startupProvider = FutureProvider<void>((ref) async {
  // Perform heavy lifting (GetStorage, etc.) here rather than blocking main()
  await AppStorage.getInstance().init();
});
