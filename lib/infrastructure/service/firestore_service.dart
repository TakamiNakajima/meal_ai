import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';

class FireStoreService {
  static final FireStoreService _instance = FireStoreService._internal();

  FireStoreService._internal();

  factory FireStoreService() {
    return _instance;
  }

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> addData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _fireStore.collection(collection).doc(documentId).set(data);
  }

  Future<Recipe> fetchRecipe(String recipeID) async {
    final querySnapshot = await _fireStore
        .collection('recipes')
        .where('id', isEqualTo: recipeID)
        .limit(1)
        .get();

    final doc = querySnapshot.docs.first;
    return Recipe.fromJson(doc.data());
  }

  Future<List<Recipe>> fetchRecipeList() async {
    final querySnapshot = await _fireStore.collection('recipes').get();

    return querySnapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList();
  }
}
