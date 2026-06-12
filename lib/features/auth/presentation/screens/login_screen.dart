import 'package:flutter/material.dart';
import 'package:management_inventory_app/exception/login_exceptions.dart';
import 'package:management_inventory_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/language_provider.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_input.dart';
import '../../widgets/common/custom_text.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final authProvider = context.read<AuthProvider>();
      await authProvider.signIn(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Provider.of<LanguageProvider>(context).isArabic;
    final authProvider = Provider.of<AuthProvider>(context);
    final errorMessage = authProvider.error != null
        ? LoginExceptions(isArabic).getErrorMessage(authProvider.error!)
        : '';

    return Scaffold(
      body: Column(
        children: [
          // Fixed Logo and Title at the Top
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Image.asset('assets/logo.png', height: 200),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomText(
                  text: isArabic ? 'تسجيل الدخول' : 'Login',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // Scrollable Form
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Email Field
                      CustomText(
                        text: isArabic ? 'البريد الإلكتروني' : 'EMAIL',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 15),
                      CustomInput(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return isArabic
                                ? 'يرجى إدخال البريد الإلكتروني'
                                : 'Please enter email';
                          }
                          if (!value.contains('@') || !value.contains('.')) {
                            return isArabic
                                ? 'بريد إلكتروني غير صالح'
                                : 'Invalid email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Password Field
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: isArabic
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        children: [
                          CustomText(
                            text: isArabic ? 'كلمة المرور' : 'PASSWORD',
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: CustomText(
                              text: isArabic
                                  ? 'نسيت كلمة المرور؟'
                                  : 'Forgot Password?',
                              fontSize: 8,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                      CustomInput(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return isArabic
                                ? 'يرجى إدخال كلمة السر'
                                : 'Please enter password';
                          }
                          if (value.length < 6) {
                            return isArabic
                                ? 'كلمة السر يجب أن تكون 6 أحرف على الأقل'
                                : 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      // Login Button
                      CustomButton(
                        customText: CustomText(
                          text: isArabic ? 'تسجيل الدخول' : 'Login',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        onPressed: _login,
                      ),

                      // Error Message after login attempt
                      if (authProvider.error != null)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomText(
                              text: errorMessage,
                              color: Colors.red,
                              fontSize: 8,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                      const SizedBox(height: 40),

                      // Sign up text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: isArabic
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        children: [
                          CustomText(
                            text: isArabic
                                ? 'ليس لديك حساب؟ '
                                : "Don't have an account? ",
                            fontSize: 8,
                            color: Colors.white,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => 
                                    const SignUpScreen(),
                                  ),
                                
                              );
                            },
                            child: CustomText(
                              text: isArabic ? 'سجل الآن' : 'Sign Up Now',
                              fontSize: 10,
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
