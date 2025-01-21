import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/const/router.dart';
import 'package:time_sheet_app/features/register/models/user_registration_model.dart';
import 'package:time_sheet_app/features/register/provider/register_provider.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});
  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  // void register(BuildContext context) async {

  //   final model = UserRegistrationModel(
  //     username: emailController.text,
  //     password: passwordController.text,
  //     confirmPassword: confirmPasswordController.text,
  //     name: nameController.text,
  //     email: emailController.text, phone_number: '',

  //   );

  //   final success = await registerController.registerUser(
  //     context: context,
  //     registrationData: model,
  //   );

  //   if (success) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Registration Successful")),
  //     );
  //     context.go(AppRouter.home);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLoading = ref.watch(registerProvider);
    final registerController = ref.read(registerProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            Center(
              child: Text(
                "Logo",
                style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "Register us",
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              "Create your new account",
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            _buildLabel("Name", size),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            _buildLabel("Phone Number", size),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: "phone number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            _buildLabel("Email", size),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "name@example.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
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
                  onPressed: togglePasswordVisibility,
                ),
                hintText: "at least 8 characters",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            _buildLabel("Confirm Password", size),
            TextField(
              controller: confirmPasswordController,
              obscureText: !isConfirmPasswordVisible,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: toggleConfirmPasswordVisibility,
                ),
                hintText: "Confirm your password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        final confirmPassword =
                            confirmPasswordController.text.trim();
                        final name = nameController.text.trim();
                        final phone_number = phoneController.text.trim();
                        if (email.isEmpty ||
                            password.isEmpty ||
                            confirmPassword.isEmpty ||
                            name.isEmpty ||
                            phone_number.isEmpty) {
                          showErrorSnackbar(
                              message: "Please fill all the fields",
                              context: context);
                          return;
                        }
                          
                 
                        UserRegistrationModel userData = UserRegistrationModel(
                          username: email,
                          password: password,
                          confirmPassword: confirmPassword,
                          name: name,
                          email: email,
                          phone_number: phone_number,            
                        );
      
                        registerController.registerUser(data:userData,context: context,  );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(size.width * 0.8, size.height * 0.06),
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        "Register",
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
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.go(AppRouter.login);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
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
