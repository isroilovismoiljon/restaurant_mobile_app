import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restourant_mobile_app/core/utils/colors.dart';
import 'package:restourant_mobile_app/core/utils/icons.dart';
import 'package:restourant_mobile_app/core/utils/styles.dart';
import 'package:restourant_mobile_app/features/common/widgets/bottom_navigation_bar/my_bottom_navigation_bar.dart';
import 'package:restourant_mobile_app/features/recipes/widget/add_recipe_image.dart';
import '../widget/add_button.dart';
import '../widget/add_recipe_custom_text_field.dart';
import '../widget/ingredient_field.dart';
import '../widget/instruction_field.dart';

class CreateRecipePage extends StatefulWidget {
  CreateRecipePage({super.key});

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final timeController = TextEditingController();

  List<TextEditingController> ingredientAmountControllers = [];
  List<TextEditingController> ingredientNameControllers = [];
  List<TextEditingController> instructionControllers = [];

  @override
  void initState() {
    super.initState();
    ingredientAmountControllers = List.generate(3, (i) => TextEditingController());
    ingredientNameControllers = List.generate(3, (i) => TextEditingController());
    instructionControllers = List.generate(3, (i) => TextEditingController());
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    timeController.dispose();
    for (var c in ingredientAmountControllers) {
      c.dispose();
    }
    for (var c in ingredientNameControllers) {
      c.dispose();
    }
    for (var c in instructionControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Create Recipe", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Publish", style: TextStyle(color: Colors.pink)),
          ),
          TextButton(
            onPressed: () {},
            child: Text("Delete", style: TextStyle(color: Colors.pink)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(34.w, 26.h, 34.w, 125.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddRecipeImage(),
            SizedBox(height: 30.h),
            Text(
              'Title',
              style: AppStyles.s15w500whiteBeigeFFFDF9,
            ),
            AddRecipeCustomTextField(hint: "Recipe title", controller: titleController),
            SizedBox(height: 10.h),
            Text(
              'Description',
              style: AppStyles.s15w500whiteBeigeFFFDF9,
            ),
            AddRecipeCustomTextField(hint: "Recipe Description", controller: descriptionController),
            SizedBox(height: 10.h),
            Text(
              'Time Recipe',
              style: AppStyles.s15w500whiteBeigeFFFDF9,
            ),
            AddRecipeCustomTextField(hint: "1hour, 30min, ...", controller: timeController),

            SizedBox(height: 12.h),
            Text("Ingredients", style: AppStyles.s15w500whiteBeigeFFFDF9),
            SizedBox(height: 10.h),
            Column(
              children: List.generate(
                ingredientNameControllers.length,
                    (index) => Row(
                  children: [
                    SvgPicture.asset(AppIcons.threeDots),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 70.w,
                      child: AddRecipeCustomTextField(
                        controller: ingredientAmountControllers[index], hint: 'Amt',
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: IngredientField(
                        controller: ingredientNameControllers[index],
                        onDelete: () {
                          setState(() {
                            ingredientAmountControllers.removeAt(index);
                            ingredientNameControllers.removeAt(index);

                          });
                        },
                      ),
                    ),

                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ingredientAmountControllers.removeAt(index);
                          ingredientNameControllers.removeAt(index);
                        });
                      },
                      child: Container(
                        width: 41.w,
                        height: 41.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.pinkFFC6C9,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppIcons.bin,
                            width: 15.w,
                            height: 22.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10.h),

            Center(
              child: AddButton(
                label: "Add Ingredient",
                onTap: () {
                  setState(() {
                    ingredientAmountControllers.add(TextEditingController());
                    ingredientNameControllers.add(TextEditingController());
                  });
                },
              ),
            ),


            SizedBox(height: 16.h),
            Text("Instructions", style: AppStyles.s15w500whiteBeigeFFFDF9),
            SizedBox(height: 8.h),
            Column(
              children: instructionControllers
                  .map(
                    (ctrl) => InstructionField(
                      controller: ctrl,
                      onDelete: () => setState(() => instructionControllers.remove(ctrl)),
                    ),
                  )
                  .toList(),
            ),
            Center(
              child: AddButton(
                label: "Add Instruction",
                onTap: () => setState(() => instructionControllers.add(TextEditingController())),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
