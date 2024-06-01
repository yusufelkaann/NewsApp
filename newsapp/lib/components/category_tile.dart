import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTile({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.primary, 
                    width: 2, 
                  ),
                )
              : null,
        ),
        child: Text(
          category,
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 16),
        ),
      ),
    );
  }
}
