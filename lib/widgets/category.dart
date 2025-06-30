import 'package:flutter/material.dart';
import 'package:travel_app/models/categories_model.dart';

class Category extends StatelessWidget{
  final List<CategoriesModel> categories;
  final void Function(int selectedIndex) onCategorySelected;

  const Category({super.key, required this.categories, required this.onCategorySelected });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => onCategorySelected(index),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                color: category.selected ? const Color(0xFFF8BA0C) : Colors.white,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                category.label,
                style: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 0.9,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}