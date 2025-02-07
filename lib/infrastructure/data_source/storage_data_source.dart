import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageDataSource {
  StorageDataSource({required FirebaseStorage storage}) : _storage = storage;
  final FirebaseStorage _storage;

  Future<String?> uploadImage({required String imagePath, required String recipeId}) async {
    File image = File(imagePath);
    try {
      final fileName = 'images/recipes/$recipeId.png';
      final snapshot = await _storage.ref().child(fileName).putFile(image);
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      return null;
    }
  }
}
