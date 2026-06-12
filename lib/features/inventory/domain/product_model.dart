class Product {
  String? id;
  String name;
  String code;
  String type;
  double price;
  int quantity;
  String unit;
  String category;
  String providerId;
  String? providerName;
  List<String>? imageUrls;
  String quality; // 'good', 'ok', 'bad'
  bool isFavorite;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.category,
    required this.providerId,
    this.providerName,
    this.imageUrls,
    this.quality = 'ok',
    this.isFavorite = false,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'price': price,
      'type': type,
      'quantity': quantity,
      'unit': unit,
      'category': category,
      'providerId': providerId,
      'providerName': providerName,
      'imageUrls': imageUrls,
      'quality': quality,
      'isFavorite': isFavorite,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Product.fromMap(String id, Map<String, dynamic> map) {
    return Product(
      id: id,
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      type: map['type'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      quantity: map['quantity'] ?? 0,
      unit: map['unit'] ?? '',
      category: map['category'] ?? '',
      providerId: map['providerId'] ?? '',
      providerName: map['providerName'],
      imageUrls: map['imageUrls'] != null ? List<String>.from(map['imageUrls']) : null,
      quality: map['quality'] ?? 'ok',
      isFavorite: map['isFavorite'] ?? false,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  // أضف دالة copyWith هنا
  Product copyWith({
    String? id,
    String? name,
    String? code,
    double? price,
    int? quantity,
    String? unit,
    String? category,
    String? providerId,
    String? providerName,
    String? imageUrl,
    String? quality,
    bool? isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      type: type ?? type,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      category: category ?? this.category,
      providerId: providerId ?? this.providerId,
      providerName: providerName ?? this.providerName,
      imageUrls: imageUrls ?? imageUrls,
      quality: quality ?? this.quality,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}