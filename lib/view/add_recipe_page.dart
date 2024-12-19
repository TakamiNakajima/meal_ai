import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_ai/model/ingredient.dart';
import 'package:meal_ai/model/recipe.dart';
import 'package:meal_ai/repository/recipe_repository.dart';
import 'package:meal_ai/style/color.dart';
import 'package:meal_ai/util/enum/meal_type.dart';
import 'package:meal_ai/util/enum/unit_type.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();

  String recipeTitle = '';
  String recipeDescription = '';
  int cookingTime = 0;
  int calories = 0;
  MealType selectedMealType = MealType.mainDish;
  List<String> steps = [];
  List<String> allergies = [];
  List<String> tags = [];
  String? imagePath;

  List<Ingredient> ingredients = [];
  List<TextEditingController> nameControllers = [];
  List<TextEditingController> quantityControllers = [];
  List<TextEditingController> saleAreaControllers = [];
  List<TextEditingController> stepControllers = [];
  List<UnitType?> unitSelections = [];

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  void _addIngredient() {
    setState(() {
      ingredients.add(Ingredient(name: '', quantity: 0, unit: UnitType.gram, saleArea: ''));
      nameControllers.add(TextEditingController());
      quantityControllers.add(TextEditingController());
      saleAreaControllers.add(TextEditingController());
      unitSelections.add(null); // Initial value is null
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      ingredients.removeAt(index);
      nameControllers[index].dispose();
      quantityControllers[index].dispose();
      saleAreaControllers[index].dispose();
      nameControllers.removeAt(index);
      quantityControllers.removeAt(index);
      saleAreaControllers.removeAt(index);
      unitSelections.removeAt(index);
    });
  }

  void _addStep() {
    setState(() {
      steps.add('');
      stepControllers.add(TextEditingController());
    });
  }

  void _removeStep(int index) {
    setState(() {
      steps.removeAt(index);
      stepControllers[index].dispose();
      stepControllers.removeAt(index);
    });
  }

  Future<void> _saveRecipe() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      for (int i = 0; i < ingredients.length; i++) {
        ingredients[i] = Ingredient(
          name: nameControllers[i].text,
          quantity: int.tryParse(quantityControllers[i].text) ?? 0,
          unit: unitSelections[i]!, // Enum value to string
          saleArea: saleAreaControllers[i].text,
        );
      }

      for (int i = 0; i < steps.length; i++) {
        steps[i] = stepControllers[i].text;
      }

      final recipe = Recipe(
        id: "id",
        title: recipeTitle,
        description: recipeDescription,
        imageUrl: "imageUrl",
        cookingTime: cookingTime,
        calorie: calories,
        ingredients: ingredients,
        mealType: selectedMealType,
        steps: steps,
        allergies: allergies,
        tags: tags,
      );

      await RecipeRepository.addRecipe(recipe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.bgWhite,
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: AppColor.mainColor,
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: imagePath == null
                      ? const Center(child: Text('画像を選択'))
                      : Image.file(
                          File(imagePath!),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 16.0),
              textInputPart("料理名", recipeTitle),
              textInputPart("説明文", recipeDescription),
              numberInputPart('調理時間（分）', cookingTime),
              numberInputPart('カロリー（kcal）', calories),
              const SizedBox(height: 16.0),
              DropdownButton<MealType>(
                value: selectedMealType,
                hint: const Text('料理タイプを選択'),
                items: MealType.values.map((type) {
                  return DropdownMenuItem<MealType>(
                    value: type,
                    child: Text(type.toLabel()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMealType = value!;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              const Text('材料リスト', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameControllers[index],
                            decoration: const InputDecoration(labelText: '材料名'),
                          ),
                          TextFormField(
                            controller: quantityControllers[index],
                            decoration: const InputDecoration(labelText: '量'),
                            keyboardType: TextInputType.number,
                          ),
                          DropdownButton<UnitType>(
                            value: unitSelections[index],
                            hint: const Text('単位を選択'),
                            items: UnitType.values.map((unit) {
                              return DropdownMenuItem<UnitType>(
                                value: unit,
                                child: Text(unit.toLabel()),
                              );
                            }).toList(),
                            onChanged: (unit) {
                              setState(() {
                                unitSelections[index] = unit;
                              });
                            },
                          ),
                          TextFormField(
                            controller: saleAreaControllers[index],
                            decoration: const InputDecoration(labelText: '売り場'),
                          ),
                          TextButton(
                            onPressed: () => _removeIngredient(index),
                            child: const Text('削除'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: _addIngredient,
                child: const Text('材料を追加'),
              ),
              const SizedBox(height: 16.0),
              const Text('調理手順', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: stepControllers[index],
                          decoration: InputDecoration(labelText: 'ステップ ${index + 1}'),
                        ),
                      ),
                      IconButton(
                        onPressed: () => _removeStep(index),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: _addStep,
                child: const Text('手順を追加'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'アレルギーリスト（カンマ区切り）'),
                onSaved: (value) => allergies = value?.split(',') ?? [],
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'タグ（カンマ区切り）'),
                onSaved: (value) => tags = value?.split(',') ?? [],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveRecipe,
                child: const Text('保存'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textInputPart(String title, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        SizedBox(
          height: 56,
          width: 160,
          child: TextFormField(
              onChanged: (value) {
                text = value;
              },
              validator: (value) => value == null || value.isEmpty ? '$titleを入力してください' : null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              )),
        ),
      ],
    );
  }

  Widget numberInputPart(String title, int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        SizedBox(
          height: 56,
          width: 160,
          child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                number = int.tryParse(value) ?? 0;
              },
              validator: (value) => value == null || value.isEmpty ? '$titleを入力してください' : null,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              )),
        ),
      ],
    );
  }
}
