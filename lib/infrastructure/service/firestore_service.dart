import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ai/infrastructure/model/recipe.dart';

class FireStoreService {
  static Future<void> addData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data
  }) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .set(data);
  }

  static Future<Recipe> fetchRecipe(String recipeID) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('recipes')
        .where('id', isEqualTo: recipeID)
        .limit(1)
        .get();

    final doc = querySnapshot.docs.first;
    return Recipe.fromMap(doc.data());
  }

  static Future<List<Recipe>> fetchRecipeList() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('recipes').get();

    final recipeList = querySnapshot.docs.map((doc) {
      return Recipe.fromMap(doc.data());
    }).toList();

    return recipeList;
  }
}
