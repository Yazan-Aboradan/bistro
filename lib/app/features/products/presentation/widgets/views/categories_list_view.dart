import 'package:bistro/app/core/values/app_colors.dart';
import 'package:bistro/extra/fake_data.dart';
import 'package:bistro/l10n/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../domain/categories_apis.dart';
import '../category_widget.dart';

class CategoriesListView extends ConsumerWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: CategoriesApis().fetchCategories(Locale(ref
          .watch(localeProvider)
          .languageCode).toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories found'));
        }


        final tempCategories = snapshot.data!.where((category) => category.parentId == null).toList();
    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;
    //final tempCategories = FakeData.getCategories(ref.read(localeProvider).languageCode).where((c) => c.parentId == null).toList();

    // if (!isLandscape) {
      bool _isGreenPattern(int index) {
        if (!isLandscape) {
          if (index == 0) return true; // first always green
          final shifted = index - 1;
          final cycleIndex = shifted % 4; // 0,1 = white | 2,3 = green
          return cycleIndex >= 2;
        }
        else {
          const pattern = [true, false, true, false, false, true, false, true];
          return pattern[index % pattern.length];
        }
      }
    bool _isSvgRightPattern(int index) {
      if (!isLandscape) {
        // Portrait: alternate
        return index % 2 != 0;
      } else {
        // Landscape: 4 true, 4 false, repeating
        final cycleIndex = index % 8; // gives 0–7, then loops back
        return cycleIndex > 4; // 0–3 → true, 4–7 → false
      }
    }

    List<Category> categories() {
      return List.generate(tempCategories.length, (i) {
        final c = tempCategories[i];
        return Category(
          id: c.id,
          name: c.name,
          parentId: c.parentId,
          whiteSvgPath: c.whiteSvgPath,
          greenSvgPath: c.greenSvgPath,
          isBackgroundGreen: _isGreenPattern(i),
          isSvgRight: _isSvgRightPattern(i),
        );
      });
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        itemCount: categories().length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isLandscape ? 4 : 2,
          mainAxisSpacing: 50,
          crossAxisSpacing: 20,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          return CategoryWidget(
            fontSize:20,
            category: categories()[index],
          );
        },
      ),
    );
      },
    );
  }
}
