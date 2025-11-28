import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/userModel/service_provider_state.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/Set_up/auth/login_screen.dart';
import 'package:fixit/Set_up/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Selction_view/selection_who_screen.dart';
import 'package:fixit/firebase/auth_service.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isChecked = false;
  final _key = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  final String phoneController = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button and logo
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, size: 28),
                      ),
                      SizedBox(width: 12),
                      SvgPicture.asset(
                        imagePath + 'Frame.svg',
                        height: 24,
                        width: 28.75,
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),

                  // Title
                  Text(
                    lang.signup_title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Color(0xFF565656),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Full Name
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: lang.full_name,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 16, right: 12),
                        child: Icon(Icons.person_outline, size: 24),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Email
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: lang.email_label,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 16, right: 12),
                        child: Icon(Icons.email_outlined, size: 24),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return lang.email_required;
                      }
                      if (!value.contains('@')) {
                        return lang.email_invalid_at;
                      }
                      if (!value.endsWith('.com')) {
                        return lang.email_invalid_com;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Password
                  TextFormField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: lang.password_label,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 16, right: 12),
                        child: Icon(Icons.lock_outline, size: 24),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return lang.password_required;
                      }
                      if (value.length < 6) {
                        return lang.password_short;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),

                  // Terms & Conditions Checkbox
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Color(0xFF0054A5),
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: lang.agree_terms,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: [
                              TextSpan(
                                text: lang.terms_conditions,
                                style: TextStyle(
                                  color: Color(0xFF0054A5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Sign Up button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _isChecked
                          ? () async {
                              if (_key.currentState!.validate()) {
                                setState(() => loading = true);

                                String? res = await _authService.signUp(
                                  name: nameController.text,
                                  phone: phoneController,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );

                                setState(() => loading = false);

                                if (res == "success") {
                                  String uid =
                                      await _authService.getUserUid() ?? "";
                                  final provider = ServiceProviderModel(
                                    uid: uid,
                                    email: emailController.text,
                                    name: nameController.text,
                                  );

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          //       ChangeNotifierProvider(
                                          //           create: (_) => ServiceProviderState(model: initialModel),
                                          //           child: AccountSetup()
                                          // ),
                                          AccountSetup(provider: provider),
                                      // LoginScreen(),
                                    ),
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        lang.account_created,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  );
                                  // Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        res!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  );
                                }
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0054A5),
                        disabledBackgroundColor: Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: loading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              lang.sign_up,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Already have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        lang.already_have_account,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  // AccountSetup()
                                  const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          lang.sign_in_now,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: const Color(0xFF0054A5),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Color(0xFFBEBEBE), thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.0),
                        child: Text(
                          lang.or,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Color(0xFFBEBEBE), thickness: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Sign up with text
                  Center(
                    child: Text(
                      lang.signup_with,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Google and Facebook buttons
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              imagePath + 'Google.svg',
                              height: 24,
                              width: 24,
                            ),
                            label: Text(
                              lang.google,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Color(0xFFBEBEBE)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              imagePath + 'Facebook.svg',
                              height: 24,
                              width: 24,
                            ),
                            label: Text(
                              lang.facebook,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Color(0xFFBEBEBE)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
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
    );
  }
}
