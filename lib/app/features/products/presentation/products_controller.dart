import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../core/values/constants/app_urls.dart';
import '../domain/categories_apis.dart';

class Ingredient {
  final String id;
  final String name;

  Ingredient({required this.id, required this.name});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['ingredient_id'] as String,
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'ingredient_id': id,
    'name': name,
  };
}


class Product {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final String price;
  final bool isAvailable;
  final Category category;
  final DateTime releaseDate;
  final List<Ingredient> ingredients;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.releaseDate,
    required this.isAvailable,
    required this.ingredients,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['product_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      imagePath: json['product_image']?.toString() ?? '',
      price: (json['price'] ?? '0').toString(),
      isAvailable: json['is_available'] as bool? ?? false,
      category: json['category'] != null
          ? Category.fromJson(json['category'] as Map<String, dynamic>)
          : Category(
        id: '',
        name: '',
        isSvgRight: false,
        isBackgroundGreen: false,
        whiteSvgPath: '',
        greenSvgPath: '',
      ),
      releaseDate: DateTime.tryParse(json['created_at']?.toString() ?? '') ?? DateTime.now(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'product_id': id,
    'name': name,
    'description': description,
    'product_image': imagePath,
    'price': price,
    'is_available': isAvailable,
    'category': category.toJson(),
    'created_at': releaseDate.toIso8601String(),
    'ingredients': ingredients.map((e) => e.toJson()).toList(),
  };
}


class ProductsController {
  Future<List<Category>> fetchSubcategories(String parentId, String lang) async {
    final url = Uri.parse('${AppUrls.baseUrl}/api/menu/categories/$parentId/subcategories/?lang=$lang');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(utf8.decode(response.bodyBytes)); // handles Arabic correctly
        return data.map((json) => Category.fromJson(json)).toList();
      } else {
        debugPrint('❌ Failed to fetch subcategories: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('❌ Error fetching subcategories: $e');
      return [];
    }
  }

  Future<List<Product>> fetchProductsByCategory({
    required String categoryId,
    required String lang,
  }) async {
    final url = Uri.parse('${AppUrls.baseUrl}/api/menu/products/by-parent/$categoryId/?lang=${lang}');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(utf8.decode(response.bodyBytes)); // handles Arabic correctly
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        print('❌ Failed to fetch products: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('❌ Error fetching products: $e');
      return [];
    }
  }

  Future<List<Product>> fetchProductsBySubCategory({
    required String categoryId,
    String lang = 'ar',
  }) async {
    final url = Uri.parse('${AppUrls.baseUrl}/api/menu/products/by-category/$categoryId/?lang=$lang');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(utf8.decode(response.bodyBytes)); // handles Arabic correctly
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        print('❌ Failed to fetch products: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('❌ Error fetching products: $e');
      return [];
    }
  }
}
