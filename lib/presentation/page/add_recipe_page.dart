import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_ai/infrastracture/model/ingredient.dart';
import 'package:meal_ai/infrastracture/model/recipe.dart';
import 'package:meal_ai/infrastracture/repository/recipe_repository.dart';
import 'package:meal_ai/infrastracture/service/storage_service.dart';
import 'package:meal_ai/presentation/style/color.dart';
import 'package:meal_ai/common/util/allergy_util.dart';
import 'package:meal_ai/common/enum/meal_type.dart';
import 'package:meal_ai/common/enum/sale_area.dart';
import 'package:meal_ai/common/enum/unit_type.dart';
import 'package:uuid/uuid.dart';

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
  List<SaleArea?> saleAreaSelections = [];

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
      ingredients.add(Ingredient(name: '', quantity: 0, unit: UnitType.gram, saleArea: SaleArea.vegetable));
      nameControllers.add(TextEditingController());
      quantityControllers.add(TextEditingController());
      saleAreaControllers.add(TextEditingController());
      unitSelections.add(null);
      saleAreaSelections.add(null);
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
      saleAreaSelections.removeAt(index);
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
          saleArea: saleAreaSelections[i]!,
        );
      }

      for (int i = 0; i < steps.length; i++) {
        steps[i] = stepControllers[i].text;
      }

      if (imagePath == null) return;

      /// 画像保存処理を追加
      String uuid = const Uuid().v4();
      final imageUrl = await StorageService.uploadImage(imagePath: imagePath!, recipeId: uuid);

      if (imageUrl == null) return;

      final recipe = Recipe(
        id: uuid,
        title: recipeTitle,
        description: recipeDescription,
        imageUrl: imageUrl,
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
                      : Image.file(File(imagePath!), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("料理タイプ"),
                  DropdownButton<MealType>(
                    value: selectedMealType,
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
                ],
              ),
              titleInputPart("料理名"),
              descriptionInputPart("説明文"),
              numberInputPart('調理時間（分）', cookingTime),
              numberInputPart('カロリー（kcal）', calories),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('検索タグ（,区切り）'),
                  SizedBox(
                    width: 160,
                    child: TextFormField(
                        onSaved: (value) => tags = value?.split(',') ?? [],
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              const Text('材料リスト', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return ingredientsCard(index);
                },
              ),
              TextButton(
                onPressed: _addIngredient,
                child: const Text(
                  '+ 材料を追加',
                  style: TextStyle(color: AppColor.mainColor),
                ),
              ),
              const SizedBox(height: 16),
              const Text('調理手順', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return stepCard(index);
                },
              ),
              TextButton(
                onPressed: _addStep,
                child: const Text(
                  '+ 手順を追加',
                  style: TextStyle(color: AppColor.mainColor),
                ),
              ),
              const SizedBox(height: 16),
              const Text('アレルギー', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  alignment: WrapAlignment.center,
                  children: AllergyUtil.allergyList.map((allergy) {
                    final isSelected = allergies.contains(allergy);
                    return ChoiceChip(
                      label: Text(
                        allergy,
                        style: TextStyle(color: isSelected ? AppColor.white : AppColor.darkGray),
                      ),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            allergies.add(allergy);
                          } else {
                            allergies.remove(allergy);
                          }
                        });
                      },
                      selectedColor: AppColor.mainColor,
                      backgroundColor: AppColor.bgWhite,
                      shape: StadiumBorder(
                        side: isSelected
                            ? BorderSide.none
                            : const BorderSide(color: AppColor.lightGray, width: 1),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                width: 200,
                height: 48,
                child: ElevatedButton(
                  onPressed: _saveRecipe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text("保存"),
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget stepCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              controller: stepControllers[index],
              decoration: InputDecoration(
                hintText: 'ステップ ${index + 1}',
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () => _removeStep(index),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  Widget ingredientsCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: TextFormField(
              controller: nameControllers[index],
              decoration: InputDecoration(
                hintText: '材料名',
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: TextFormField(
              controller: quantityControllers[index],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '量',
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: DropdownButton<UnitType>(
              value: unitSelections[index],
              hint: const Text('単位'),
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
          ),
          SizedBox(
            width: 80,
            child: DropdownButton<SaleArea>(
              value: saleAreaSelections[index],
              hint: const Text('売り場'),
              items: SaleArea.values.map((saleArea) {
                return DropdownMenuItem<SaleArea>(
                  value: saleArea,
                  child: Text(saleArea.toLabel()),
                );
              }).toList(),
              onChanged: (saleArea) {
                setState(() {
                  saleAreaSelections[index] = saleArea;
                });
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              _removeIngredient(index);
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  Widget titleInputPart(String title) {
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
                recipeTitle = value;
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

  Widget descriptionInputPart(String title) {
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
                recipeDescription = value;
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
