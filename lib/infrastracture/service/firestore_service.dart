import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ai/infrastracture/model/recipe.dart';

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

  static Future<List<Recipe>> fetchRecipes() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('recipes').get();

    final recipeList = querySnapshot.docs.map((doc) {
      return Recipe.fromMap(doc.data());
    }).toList();

    return recipeList;
  }
}
