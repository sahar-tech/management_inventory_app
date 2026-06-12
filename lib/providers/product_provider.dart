import 'package:flutter/foundation.dart';
import '../../../models/product.dart';
import '../../../services/firestore_service.dart';

class ProductProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _filteredProducts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // جلب المنتجات
  Future<void> fetchProducts(String userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _firestoreService.getProducts(userId);
      _filteredProducts = _products;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // إضافة منتج جديد
  Future<void> addProduct(String userId, Product product) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _firestoreService.addProduct(userId, product);
      await fetchProducts(userId); // إعادة تحميل المنتجات
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // تحديث منتج موجود - أضف هذه الدالة
  Future<void> updateProduct(String userId, Product product) async {
    _isLoading = true;
    notifyListeners();

    try {
      if (product.id != null) {
        await _firestoreService.updateProduct(userId, product);
        
        // تحديث القائمة المحلية
        final index = _products.indexWhere((p) => p.id == product.id);
        if (index != -1) {
          _products[index] = product;
          _filteredProducts = _products;
        }
        
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // حذف منتج
  Future<void> deleteProduct(String userId, String productId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _firestoreService.deleteProduct(userId, productId);
      _products.removeWhere((p) => p.id == productId);
      _filteredProducts.removeWhere((p) => p.id == productId);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // التصفية حسب الفئة
  void filterByCategory(String category) {
    if (category == 'all') {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) => product.category == category)
          .toList();
    }
    notifyListeners();
  }

  // التصفية حسب الجودة
  void filterByQuality(String quality) {
    _filteredProducts = _products
        .where((product) => product.quality == quality)
        .toList();
    notifyListeners();
  }

  // البحث
  void search(String query) {
    if (query.isEmpty) {
      _filteredProducts = _products;
    } else {
      _filteredProducts = _products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()) ||
              product.code.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  // مسح الفلتر
  void clearFilter() {
    _filteredProducts = _products;
    notifyListeners();
  }
}