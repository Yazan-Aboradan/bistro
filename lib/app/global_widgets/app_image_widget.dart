import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../core/values/app_colors.dart';

class AppImageWidget extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;
  final BoxFit fit;
  final List<double> radius;

  const AppImageWidget({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.radius = const [],
  });

  bool get _isSvg => (path ?? '').toLowerCase().endsWith('.svg');
  bool get _isAsset => (path ?? '').contains('assets/');

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(radius.isNotEmpty ? radius[0] : 0),
      bottomLeft: Radius.circular(radius.length > 1 ? radius[1] : 0),
      topRight: Radius.circular(radius.length > 2 ? radius[2] : 0),
      bottomRight: Radius.circular(radius.length > 3 ? radius[3] : 0),
    );

    // ✅ Handle null/empty
    if (path == null || path!.trim().isEmpty) {
      return _fallbackLogo(borderRadius);
    }

    Widget imageWidget;

    try {
      if (_isAsset) {
        // ✅ Asset
        imageWidget = _isSvg
            ? SvgPicture.asset(
          path!,
          width: width,
          height: height,
          fit: fit,
        )
            : Image.asset(
          path!,
          width: width,
          height: height,
          fit: fit,
        );
      } else {
        // ✅ Network
        if (_isSvg) {
          // SvgPicture.network has no errorBuilder → wrap with FutureBuilder
          imageWidget = FutureBuilder<http.Response>(
            future: http.get(Uri.parse(path!)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.statusCode != 200) {
                return _fallbackLogo(borderRadius);
              } else {
                return SvgPicture.network(
                  path!,
                  width: width,
                  height: height,
                  fit: fit,
                );
              }
            },
          );
        } else {
          // Normal image
          imageWidget = kIsWeb
              ? Image.network(
            path!,
            width: width,
            height: height,
            fit: fit,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const Center(
                child:
                CircularProgressIndicator(color: AppColors.primary),
              );
            },
            errorBuilder: (context, url, error) =>
                _fallbackLogo(borderRadius),
          )
              : CachedNetworkImage(
            imageUrl: path!,
            width: width,
            height: height,
            fit: fit,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            errorWidget: (context, url, error) =>
                _fallbackLogo(borderRadius),
          );
        }
      }
    } catch (_) {
      imageWidget = _fallbackLogo(borderRadius);
    }

    return ClipRRect(
      borderRadius: borderRadius,
      child: imageWidget,
    );
  }

  Widget _fallbackLogo(BorderRadius borderRadius) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        'assets/images/Bistro_logo.png',
        width: width ?? 50,
        height: height ?? 50,
        fit: fit,
      ),
    );
  }
}
