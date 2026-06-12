import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../exception/login_exceptions.dart';
import '../../providers/auth_provider.dart';
import '../../providers/language_provider.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_input.dart';
import '../../widgets/common/custom_text.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            Provider.of<LanguageProvider>(context, listen: false).isArabic
                ? 'كلمة المرور وتأكيد كلمة المرور غير متطابقين'
                : 'Password and Confirm Password do not match',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final authProvider = context.read<AuthProvider>();
      await authProvider.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        fullName: _fullNameController.text.trim(),
      );

      if (authProvider.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              Provider.of<LanguageProvider>(context, listen: false).isArabic
                  ? 'حدث خطأ: ${authProvider.error}'
                  : 'An error occurred: ${authProvider.error}',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
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
          // Fixed Part: Logo & Title
          Column(
            children: [
Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Image.asset('assets/logo.png', height: 200),
                ),
              ),              const SizedBox(height: 20),
              Center(
                child: CustomText(
                  text: isArabic ? 'إنشاء حساب' : 'Sign Up',
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
                      // Full Name Field
                      CustomText(
                        text: isArabic ? 'الاسم الكامل' : 'FULL NAME',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      CustomInput(
                        controller: _fullNameController,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return isArabic
                                ? 'يرجى إدخال الاسم الكامل'
                                : 'Please enter full name';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      // Email Field
                      CustomText(
                        text: isArabic ? 'البريد الإلكتروني' : 'EMAIL',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
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

                      const SizedBox(height: 10),

                      // Password Field
                      CustomText(
                        text: isArabic ? 'كلمة المرور' : 'PASSWORD',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      CustomInput(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Provider.of<LanguageProvider>(
                                  context,
                                ).isArabic
                                ? 'يرجى إدخال كلمة السر'
                                : 'Please enter password';
                          }
                          if (value.length < 6) {
                            return Provider.of<LanguageProvider>(
                                  context,
                                ).isArabic
                                ? 'كلمة السر يجب أن تكون 6 أحرف على الأقل'
                                : 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      // Confirm Password Field
                      CustomText(
                        text: isArabic
                            ? 'تأكيد كلمة المرور'
                            : 'CONFIRM PASSWORD',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      CustomInput(
                        controller: _confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Provider.of<LanguageProvider>(
                                  context,
                                ).isArabic
                                ? 'يرجى إدخال كلمة السر'
                                : 'Please enter password';
                          }
                          if (value.length < 6) {
                            return Provider.of<LanguageProvider>(
                                  context,
                                ).isArabic
                                ? 'كلمة السر يجب أن تكون 6 أحرف على الأقل'
                                : 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Sign Up Button
                      CustomButton(
                        customText: CustomText(
                          text: isArabic ? 'إنشاء الحساب' : 'Sign Up',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        onPressed: _signUp,
                      ),

                      // Error Message after sign up attempt
                      if (authProvider.error != null)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomText(
                              text: errorMessage,
                              color: Colors.red,
                              fontSize: 10,
                            ),
                          ),
                        ),

                      const SizedBox(height: 10),

                      // Divider with "Or"
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Colors.white, indent: 10),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: CustomText(
                              text: isArabic ? 'أو' : 'Or',
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Colors.white, endIndent: 10),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Social Login Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 50,
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(
                              Icons.g_mobiledata,
                              color: Colors.white,
                              size: 80,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Login Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: isArabic
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        children: [
                          CustomText(
                            text: isArabic
                                ? 'ألديك حساب بالفعل؟ '
                                : "Already have an account? ",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                                
                              );
                            },
                            child: CustomText(
                              text: isArabic ? 'سجل الدخول هنا' : 'Login Here',
                              fontSize: 8,
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
