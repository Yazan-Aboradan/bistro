import 'package:bistro/app/core/storage/app_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bistro/app/features/main/main_page.dart' deferred as main_page;
import 'package:bistro/app/features/auth/presentation/login/auth_login_page.dart'
    deferred as login_page;

// Provides a Future that resolves when critical app initialization is done
final startupProvider = FutureProvider<void>((ref) async {
  // Start preloading the code for the next screens immediately (Fire-and-forget)
  // This runs in parallel with storage init, reducing the chance of a spinner appearing after splash
  main_page.loadLibrary();
  login_page.loadLibrary();

  // Perform heavy lifting (GetStorage, etc.) here rather than blocking main()
  await AppStorage.getInstance().init();
});
