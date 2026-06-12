import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // الحصول على حالة المستخدم الحالي
  User? get currentUser => _auth.currentUser;

  // تسجيل الدخول
  Future<UserModel> signIn(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      /*
      final userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      
      return UserModel.fromMap(
        userCredential.user!.uid,
        userDoc.data()!,
      );*/
      return UserModel(
        uid: userCredential.user!.uid,
        email: email,
        fullName: '',
       );

    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // تسجيل جديد
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
     final user = UserModel(
        uid: userCredential.user!.uid,
        email: email,
        fullName: fullName,
        language: 'ar',
      );
      
     /*  await _firestore
          .collection('users')
          .doc(user.uid)
          .set(user.toMap());
      */ 
      return user;   

    } catch (e) {
      throw Exception('Failed to sign up: ${e.toString()}');
    }
  }

  // تسجيل الخروج
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // إعادة تعيين كلمة المرور
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // تحديث المستخدم
  Future<void> updateUser(UserModel user) async {
    await _firestore
        .collection('users')
        .doc(user.uid)
        .update(user.toMap());
  }

  // الاستماع لتغيرات المصادقة
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}