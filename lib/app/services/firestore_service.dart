import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_inventory_app/features/inventory/domain/product_model.dart';
import 'package:management_inventory_app/features/supplier/domain/supplier_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // الحصول على جميع المنتجات
  Future<List<Product>> getProducts(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('products')
          .orderBy('createdAt', descending: true)
          .get();
      
      return snapshot.docs
          .map((doc) => Product.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get products: ${e.toString()}');
    }
  }

  // إضافة منتج جديد
  Future<void> addProduct(String userId, Product product) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('products')
          .add(product.toMap());
    } catch (e) {
      throw Exception('Failed to add product: ${e.toString()}');
    }
  }

  // تحديث منتج
  Future<void> updateProduct(String userId, Product product) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('products')
          .doc(product.id)
          .update(product.toMap());
    } catch (e) {
      throw Exception('Failed to update product: ${e.toString()}');
    }
  }

  // حذف منتج
  Future<void> deleteProduct(String userId, String productId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('products')
          .doc(productId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete product: ${e.toString()}');
    }
  }

  // الحصول على الموردين
  Future<List<Supplier>> getSuppliers(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('providers')
          .orderBy('name')
          .get();
      
      return snapshot.docs
          .map((doc) => Supplier.fromMap(doc.id, doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get providers: ${e.toString()}');
    }
  }

  // إضافة مورد جديد
  Future<void> addSupplier(String userId, Supplier supplier) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('suppliers')
          .add(supplier.toMap());
    } catch (e) {
      throw Exception('Failed to add supplier: ${e.toString()}');
    }
  }
}
