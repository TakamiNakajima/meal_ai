import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';

class FireStoreService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<Recipe> fetchRecipe(String recipeID) async {
    final querySnapshot =
        await _fireStore.collection('recipes').where('id', isEqualTo: recipeID).limit(1).get();

    final doc = querySnapshot.docs.first;
    return Recipe.fromJson(doc.data());
  }

  Future<List<Recipe>> fetchRecipeList() async {
    final querySnapshot = await _fireStore.collection('recipes').get();

    return querySnapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList();
  }

  /// 歩数データの保存処理
  ///
  /// 処理時間短縮のため保存処理を並列実行する
  Future<void> setAllHealthData({
    required List<Map<String, dynamic>> healthDataList,
    required String userId,
  }) async {
    try {
      final List<Future> futures = [];
      for (final healthData in healthDataList) {
        futures.add(
          _setHealthData(userId: userId, dataMap: healthData),
        );
      }
      await Future.wait(futures);

      // 最終更新時刻を更新
      await setLastUpdatedAt(userId: userId, collection: 'healthData', key: 'lastUpdatedAt');
    } catch (e) {
      debugPrint('_setAllHealthDataエラー: $e');
    }
  }

  /// [healthData]コレクションに歩数データを保存する
  Future<void> _setHealthData({
    required String userId,
    required Map<String, dynamic> dataMap,
  }) async {
    await _fireStore.collection('healthData').doc(userId).collection('steps').doc(dataMap['dateTime']).set({
      'dataList': dataMap['dataList'],
      'dateTime': dataMap['dateTime'],
    });
  }

  /// [healthData]コレクションの最終更新時刻を取得する
  Future<DateTime> getLastUpdatedAt({required String userId}) async {
    final querySnapshot = await _fireStore.collection('healthData').doc(userId).get();
    final lastUpdatedAt = (querySnapshot.data()!['lastUpdatedAt'] as Timestamp).toDate();

    return lastUpdatedAt;
  }

  /// 最終更新時刻を更新する
  Future<void> setLastUpdatedAt({
    required String userId,
    required String collection,
    required String key,
  }) async {
    await FirebaseFirestore.instance.collection(collection).doc(userId).set({
      key: Timestamp.fromDate(DateTime.now()),
    });
  }
}
