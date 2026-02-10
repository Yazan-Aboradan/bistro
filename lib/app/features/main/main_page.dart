import 'dart:convert';
import 'package:bistro/extra/fake_data.dart';
import 'package:bistro/l10n/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../global_widgets/dialog_message_widget.dart';
import '../products/domain/categories_apis.dart';
import '../products/presentation/products_controller.dart';
import '../products/presentation/widgets/views/featured_products_widget.dart';
import 'main_content.dart';
import 'widgets/views/main_background_view.dart';
import 'package:bistro/app/core/values/constants/app_urls.dart';
final featuredProductsProvider = FutureProvider<List<FeaturedProduct>>((ref) async {
  final lang = ref.read(localeProvider).languageCode;
  return await FeaturedProductsApi.fetchFeaturedProducts(lang);
});

final featuredDialogShownProvider = StateProvider<bool>((ref) => false);

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final alreadyShown = ref.read(featuredDialogShownProvider);
      if (alreadyShown) return;

      ref.read(featuredDialogShownProvider.notifier).state = true;
      await Future.delayed(const Duration(milliseconds: 300));

      if (_dialogShown) return;
      _dialogShown = true;

      // Fetch API data
      final featuredProducts = await ref.read(featuredProductsProvider.future);

      if (featuredProducts.isNotEmpty) {
        final product = featuredProducts.first;

        showFeatureProductPopUP(
          context: context,
          product: product,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MainBackgroundView(),
          MainContent(),
        ],
      ),
    );
  }
}

// API fetching class
class FeaturedProductsApi {
  static Future<List<FeaturedProduct>> fetchFeaturedProducts(String lang) async {
    try {
      final url = Uri.parse('${AppUrls.featuredProductsUrl}?lang=$lang');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(utf8.decode(response.bodyBytes));

        return data.whereType<Map<String, dynamic>>().map((json) => FeaturedProduct.fromJson(json)).toList();
      } else {
        debugPrint('❌ Failed to fetch featured products: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('❌ Error fetching featured products: $e');
      return [];
    }
  }
}
