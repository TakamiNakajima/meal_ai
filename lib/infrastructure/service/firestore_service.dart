import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';

class FireStoreService {
  FireStoreService({required FirebaseFirestore fireStore}) : _fireStore = fireStore;
  final FirebaseFirestore _fireStore;

  Future<void> addData(
      {required String collection, required String documentId, required Map<String, dynamic> data}) async {
    await _fireStore.collection(collection).doc(documentId).set(data);
  }

  Future<Recipe> fetchRecipe(String recipeID) async {
    final querySnapshot =
        await _fireStore.collection('recipes').where('id', isEqualTo: recipeID).limit(1).get();

    final doc = querySnapshot.docs.first;
    return Recipe.fromJson(doc.data());
  }

  Future<List<Recipe>> fetchRecipeList() async {
    final querySnapshot = await _fireStore.collection('recipes').get();

    final recipeList = querySnapshot.docs.map((doc) {
      return Recipe.fromJson(doc.data());
    }).toList();

    return recipeList;
  }
}
