import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // رفع صورة
  Future<String> uploadImage(File image, String userId, String fileName) async {
    try {
      final ref = _storage.ref().child('users/$userId/images/$fileName');
      final uploadTask = ref.putFile(image);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload image: ${e.toString()}');
    }
  }

  // حذف صورة
  Future<void> deleteImage(String imageUrl) async {
    try {
      final ref = _storage.refFromURL(imageUrl);
      await ref.delete();
    } catch (e) {
      throw Exception('Failed to delete image: ${e.toString()}');
    }
  }

  // رفع صورة المنتج
  Future<String> uploadProductImage(File image, String userId, String productId) async {
    final fileName = 'product_${DateTime.now().millisecondsSinceEpoch}.jpg';
    return await uploadImage(image, userId, fileName);
  }

  // رفع صورة الملف الشخصي
  Future<String> uploadProfileImage(File image, String userId) async {
    final fileName = 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
    return await uploadImage(image, userId, fileName);
  }
}