import 'package:flutter/material.dart';
import 'add_recipe_custom_text_field.dart';

class InstructionField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onDelete;

  const InstructionField({
    super.key,
    required this.controller,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AddRecipeCustomTextField(hint: "Instruction", controller: controller)),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
