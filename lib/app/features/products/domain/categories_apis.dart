import 'package:bistro/app/core/values/constants/app_urls.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoriesApis {
  Future<List<Category>> fetchCategories(String lang) async {
    final url = Uri.parse('${AppUrls.getCategoriesUrl}?lang=$lang');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode using utf8 to support Arabic or special characters
        final decoded = utf8.decode(response.bodyBytes);
        final List<dynamic> data = jsonDecode(decoded);
        return data.map((e) => Category.fromJson(e as Map<String, dynamic>)).toList();
      } else {
        print('❌ Failed to fetch categories: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('❌ Error fetching categories: $e');
      return [];
    }
  }

  Future<List<Category>> fetchSubcategories(String parentId, String lang) async {
    final url = Uri.parse('${AppUrls.baseUrl}/api/menu/categories/$parentId/subcategories/?lang=$lang');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        return data.map((json) => Category.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        debugPrint('❌ Failed to fetch subcategories: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('❌ Error fetching subcategories: $e');
      return [];
    }
  }
}

class Category {
  final String id;
  final String name;
  final bool? isSvgRight;
  final bool? isBackgroundGreen;
  final String whiteSvgPath;
  final String greenSvgPath;
  final String? parentId;

  Category({
    required this.id,
    required this.name,
    this.isSvgRight,
    this.isBackgroundGreen,
    required this.whiteSvgPath,
    required this.greenSvgPath,
    this.parentId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['category_id']?.toString() ?? '',
        name: json['name']?.toString() ?? '',
        isSvgRight: json['is_svg_right'] as bool? ?? false,
        isBackgroundGreen: json['is_background_green'] as bool? ?? false,
        whiteSvgPath: json['white_svg_path']?.toString() ?? '',
        greenSvgPath: json['green_svg_path']?.toString() ?? '',
        parentId: json['parent']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        'category_id': id,
        'name': name,
        'is_svg_right': isSvgRight,
        'is_background_green': isBackgroundGreen,
        'white_svg_path': whiteSvgPath,
        'green_svg_path': greenSvgPath,
        'parent': parentId,
      };
}
