
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_sheet_app/model/login_model.dart';
import 'package:time_sheet_app/provider/login_provider.dart';
import 'package:time_sheet_app/view/home_page.dart';
import 'package:time_sheet_app/view/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool rememberMe = true;

  void login(BuildContext context) async {
    final provider = Provider.of<LoginProvider>(context, listen: false);

    final model = LoginModel(
      username: usernameController.text.trim(),
      password: passwordController.text.trim(),
    );

    final success = await provider.login(model);

    if (success) {
      if (rememberMe) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', model.username);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful")),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(provider.errorMessage)),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('username')) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<LoginProvider>(context);

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
                SizedBox(height: size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        Text("Remember me"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.03),
                Center(
                  child: provider.isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () => login(context),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(size.width * 0.8, size.height * 0.06),
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationPage()),
                              );
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
