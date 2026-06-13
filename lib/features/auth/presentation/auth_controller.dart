import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/auth_repository.dart';
import '../domain/user_model.dart';

// 1. مراقب لحظي يتابع حالة تسجيل الدخول الأساسية من فايربيس
final authStateStreamProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

// 2. مراقب ذكي يجلب بيانات الصلاحيات والتفعيل بالكامل فور توفر مستخدم مسجل
final currentUserDataProvider = FutureProvider<UserModel?>((ref) async {
  final authState = ref.watch(authStateStreamProvider).value;
  if (authState == null) return null;
  
  final authRepository = ref.watch(authRepositoryProvider);
  return await authRepository.getUserData(authState.uid);
});

// 3. متحكم واجهات تسجيل الدخول والاشتراك لإدارة حالات التحميل والأخطاء
final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  return AuthController(authRepository: ref.watch(authRepositoryProvider));
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AsyncValue.data(null));

  // 🔑 دالة تسجيل الدخول والتحقق من التفعيل والصلاحية
  Future<bool> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = const AsyncValue.loading();
    try {
      final userCredential = await _authRepository.signInWithEmail(email, password);
      
      if (userCredential.user != null) {
        // جلب بيانات الحساب فوراً للتحقق من التفعيل قبل السماح بالدخول
        final userData = await _authRepository.getUserData(userCredential.user!.uid);
        
        if (userData != null && !userData.isActive && userData.role != 'admin') {
          // الحساب غير مفعّل وليس مديراً -> طرد فوري وعرض رسالة الانتظار
          await _authRepository.signOut();
          state = const AsyncValue.data(null);
          _showSnackBar(context, 'حسابك في انتظار تفعيل المدير وصلاحيات العمل.');
          return false;
        }
      }
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      _showSnackBar(context, e.toString().replaceAll('Exception: ', ''));
      return false;
    }
  }

  // 📝 دالة إنشاء حساب جديد للعمال بالقيود التلقائية
  Future<bool> registerWorker({
    required String email,
    required String password,
    required String username,
    required BuildContext context,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _authRepository.signUpWorker(
        email: email,
        password: password,
        username: username,
      );
      // بعد التسجيل، يتم طرد العامل تلقائياً ليعرض النظام شاشة الانتظار
      await _authRepository.signOut();
      state = const AsyncValue.data(null);
      _showSnackBar(context, 'تم إنشاء حسابك بنجاح! بانتظار موافقة المدير وتفعيل الصلاحيات.');
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      _showSnackBar(context, e.toString().replaceAll('Exception: ', ''));
      return false;
    }
  }

  // 🚪 دالة تسجيل الخروج الكلية
  Future<void> logout() async {
    state = const AsyncValue.loading();
    await _authRepository.signOut();
    state = const AsyncValue.data(null);
  }

  // أداة مساعدة لعرض رسائل الأخطاء أو التنبيهات على الشاشة بسلاسة
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontFamily: 'Cairo')),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
