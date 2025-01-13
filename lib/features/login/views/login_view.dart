import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/const/route.dart';
import 'package:time_sheet_app/features/login/model/user_login_model.dart';
import 'package:time_sheet_app/features/login/provider/login_provider.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLoading = ref.watch(loginProvider);
    final loginController = ref.read(loginProvider.notifier);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.15),
                Center(
                  child: Text(
                    "Logo",
                    style: TextStyle(
                      fontSize: size.width * 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.10),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                _buildLabel("Username", size),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                _buildLabel("Password", size),
                TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    hintText: "at least 8 characters",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Center(
                  child: isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            final email = usernameController.text.trim();
                            final password = passwordController.text.trim();
                            if (email.isEmpty || password.isEmpty) {
                              showErrorSnackbar(
                                  message: "Please fill in all fields to login",
                                  context: context);
                              return;
                            }
                            UserLoginModel userData = UserLoginModel(
                                username: email, password: password);
                            loginController.loginUser(
                                context: context, loginData: userData);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(size.width * 0.8, size.height * 0.06),
                            backgroundColor: Colors.purple,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
                SizedBox(height: size.height * 0.10),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(AppRoute.register);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, Size size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.width * 0.045,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    );
  }
}
