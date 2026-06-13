import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String email;
  final String username;  
  final String? fullName;
  final String? phoneNumber;
  final String? profileImageUrl;
  final String role;
  final bool isActive;      

  const UserModel({
    required this.uid,
    required this.email,
    required this.username,
     this.fullName,
     this.phoneNumber,
     this.profileImageUrl,
    required this.role,
    required this.isActive,
  });

 factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}