import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static Future<void> addData({required String collection, required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance.collection(collection).add(data);
  }
}