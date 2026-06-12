import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/user_model.dart';

// 💡 مزوّد عالمي يجعل المستودع متاحاً بأمان في كل أجزاء التطبيق عبر ريفر بود
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  // 🔄 مراقب لحظي يراقب تغير حالة المستخدم (تسجيل دخول أو خروج) من فايربيس
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // 🔍 جلب بيانات العامل أو المدير بالكامل من Firestore وتحويلها لكائن UserModel
  Future<UserModel?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists && doc.data() != null) {
        return UserModel.fromJson(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('فشل في جلب بيانات المستخدم من السيرفر: $e');
    }
  }

  // 🔑 عملية تسجيل الدخول العادية بالإيميل وكلمة السر
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'حدث خطأ غير متوقع أثناء تسجيل الدخول.');
    }
  }

  // 📝 تسجيل حساب جديد لعامل جديد (وتعطيله تلقائياً حتى يوافق زوجكِ)
  Future<UserCredential> signUpWorker({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // إنشاء كائن المستخدم بالصلاحيات المقفلة افتراضياً
        final newUser = UserModel(
          uid: userCredential.user!.uid,
          name: name,
          email: email,
          role: 'worker',    // الصلاحية الافتراضية عامل حتى يغيرها المدير
          isActive: false,  // الحساب مغلق وموقوف تلقائياً بانتظار التفعيل
        );

        // حفظ الخريطة الناتجة في Firestore داخل جدول users
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(newUser.toJson());
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'فشل في إنشاء الحساب السحابي.');
    }
  }

  // 🚪 تسجيل الخروج وإنهاء الجلسة الحالية
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
