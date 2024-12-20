import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static Future<String?> uploadImage(String imagePath, String uuid) async {
    File image = File(imagePath);

    try {
      final storageRef = FirebaseStorage.instance.ref();
      final fileName = 'recipes/$uuid.png';
      final uploadTask = storageRef.child(fileName).putFile(image);

      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      return null;
    }
  }
}
