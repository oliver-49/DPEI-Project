import 'package:fixit/firebase/auth_service.dart';
import 'package:fixit/firebase/role_mode.dart';
import 'package:fixit/userModel/service_provider_model.dart';
import 'package:fixit/ye/navigation_page.dart';
import 'package:fixit/ye/utalities/colors.dart';
import 'package:fixit/yreyhan/auth/singup_screen.dart';
import 'package:fixit/yreyhan/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fixit/gitHub/presentation/screens/account_service/Selction_view/selection_who_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final _key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  bool loading = false;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  //back button and logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // IconButton(
                      //   onPressed:null,
                      //   icon: null,//const Icon(Icons.arrow_back, size: 30),
                      // ),
                      const SizedBox(width: 16),
                      SvgPicture.asset(
                        imagePath + 'Frame.svg',
                        height: 24,
                        width: 28.75,
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  //welcome back text
                  Text(
                    "Enter your email and password to login",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF565656),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //email
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
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
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Email must contains with @';
                      }
                      if (!value.endsWith('.com')) {
                        return 'Email must end with .com';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Password
                  TextFormField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Enter password',
                      prefixIcon: const Padding(
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
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  //forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  //Sign in button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          setState(() => loading = true);

                          String? res = await _authService.signIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          setState(() => loading = false);

                          if (res == "success") {
                            String uid=await _authService.getUserUid()??"";
                               final provider = ServiceProviderModel(
  uid: uid,
);
                            String? role = await RoleMode().getUserRole();//allsetup
                            if( role == 'not-detect'){
                                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AccountSetup(provider: provider,),
                                ),
                              );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Logged in successfully")),
                                );
                            }else{
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavigationPage(),
                                ),
                              );
                            
                            }
                          } else {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(res!,style: TextStyle(color: Colors.white),)));
                          }

                          
                        }else {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("please , input valid data",style: TextStyle(color: Colors.white),)));
                          }
                      
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0054A5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: loading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Sign In",
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

                  // Text sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New to fixIt?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up now",
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

                  SizedBox(height: 24),
                  //or
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Color(0xFFBEBEBE), thickness: 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.0),
                        child: Text(
                          "Or",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                              ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Color(0xFFBEBEBE), thickness: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  //log in with
                  Text(
                    "Log in with",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 12),
                  // google and facebook button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Google button
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          width: 155,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              imagePath + 'Google.svg',
                              height: 24,
                              width: 24,
                            ),

                            label: Text(
                              'Google',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Color(0xFFBEBEBE)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 17),
                      // Facebook button
                      Expanded(
                        child: SizedBox(
                          height: 56,
                          width: 155,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              imagePath + 'Facebook.svg',
                              height: 24,
                              width: 24,
                            ),
                            label: Text(
                              'Facebook',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Color(0xFFBEBEBE)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
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
