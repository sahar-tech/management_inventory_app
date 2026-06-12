class UserModel {
  String? uid;
  String email;
  String fullName;
  String? phoneNumber;
  String? profileImageUrl;
  String language;

  UserModel({
    this.uid,
    required this.email,
    required this.fullName,
    this.phoneNumber,
    this.profileImageUrl,
    this.language = 'ar',
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'language': language,
    };
  }

  factory UserModel.fromMap(String uid, Map<String, dynamic> map) {
    return UserModel(
      uid: uid,
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber'],
      profileImageUrl: map['profileImageUrl'],
      language: map['language'] ?? 'ar',
    );
  }
}