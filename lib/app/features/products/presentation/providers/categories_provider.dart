import 'package:bistro/l10n/providers/locale_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/categories_apis.dart';

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  return CategoriesApis().fetchCategories(ref.watch(localeProvider).languageCode);
});

final subcategoriesProvider = FutureProvider.family
    .autoDispose<List<Category>, String>((ref, parentId) async {
  final lang = ref.watch(localeProvider).languageCode;
  return CategoriesApis().fetchSubcategories(parentId, lang);
});
