import 'package:flutter/material.dart';
import 'add_recipe_custom_text_field.dart';

class IngredientField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onDelete;

  const IngredientField({
    super.key,
    required this.controller,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AddRecipeCustomTextField(hint: "Ingredient", controller: controller)),
      ],
    );
  }
}
