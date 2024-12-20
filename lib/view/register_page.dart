// // // import 'package:flutter/material.dart';

// // // class RegistrationPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final size = MediaQuery.of(context).size;

// // //     return Scaffold(
// // //       body: SingleChildScrollView(
// // //         child: Padding(
// // //           padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               SizedBox(height: size.height * 0.05),  // Reduced space
// // //               // Logo
// // //               Center(
// // //                 child: Text(
// // //                   "Logo",
// // //                   style: TextStyle(
// // //                     fontSize: size.width * 0.08,  // Reduced font size
// // //                     fontWeight: FontWeight.bold,
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.02),
// // //               // Title
// // //               Text(
// // //                 "Register us",
// // //                 style: TextStyle(
// // //                   fontSize: size.width * 0.05,  // Reduced font size
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Colors.black,
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.01),
// // //               Text(
// // //                 "Create your new account",
// // //                 style: TextStyle(
// // //                   fontSize: size.width * 0.04,  // Reduced font size
// // //                   color: Colors.grey,
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.02), // Reduced space
// // //               // Name Field
// // //               _buildLabel("Name", size),
// // //               TextField(
// // //                 decoration: InputDecoration(
// // //                   prefixIcon: Icon(Icons.person),
// // //                   hintText: "name",
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.015),  // Reduced space
// // //               // Email Field
// // //               _buildLabel("Email", size),
// // //               TextField(
// // //                 decoration: InputDecoration(
// // //                   prefixIcon: Icon(Icons.email),
// // //                   hintText: "name@example.com",
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.015),  // Reduced space
// // //               // Password Field
// // //               _buildLabel("Password", size),
// // //               TextField(
// // //                 obscureText: true,
// // //                 decoration: InputDecoration(
// // //                   prefixIcon: Icon(Icons.lock),
// // //                   suffixIcon: Icon(Icons.visibility),
// // //                   hintText: "at least 8 characters",
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.015),  // Reduced space
// // //               // Confirm Password Field
// // //               _buildLabel("Confirm Password", size),
// // //               TextField(
// // //                 obscureText: true,
// // //                 decoration: InputDecoration(
// // //                   prefixIcon: Icon(Icons.lock),
// // //                   suffixIcon: Icon(Icons.visibility),
// // //                   hintText: "at least 8 characters",
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.015),  // Reduced space
// // //               // Remember me Checkbox
// // //               Row(
// // //                 children: [
// // //                   Checkbox(
// // //                     value: true,
// // //                     onChanged: (value) {},
// // //                   ),
// // //                   Text("Remember me"),
// // //                 ],
// // //               ),
// // //               SizedBox(height: size.height * 0.015),  // Reduced space
// // //               // Register Button
// // //               Center(
// // //                 child: ElevatedButton(
// // //                   onPressed: () {},
// // //                   style: ElevatedButton.styleFrom(
// // //                     minimumSize: Size(size.width * 0.8, size.height * 0.06),
// // //                     backgroundColor: Colors.purple,
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.zero,
// // //                     ),
// // //                   ),
// // //                   child: Text(
// // //                     "Register",
// // //                     style: TextStyle(
// // //                       fontSize: size.width * 0.04,  // Reduced font size
// // //                       color: Colors.white,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.02),  // Reduced space
// // //               // Divider with Text
// // //               Row(
// // //                 children: [
// // //                   Expanded(child: Divider(color: Colors.grey)),
// // //                   Padding(
// // //                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
// // //                     child: Text("Or continue with"),
// // //                   ),
// // //                   Expanded(child: Divider(color: Colors.grey)),
// // //                 ],
// // //               ),
// // //               SizedBox(height: size.height * 0.02),  // Reduced space
// // //               // Social Media Buttons
// // //               // Row(
// // //               //   mainAxisAlignment: MainAxisAlignment.center,
// // //               //   children: [
// // //               //     Flexible(
// // //               //       child: IconButton(
// // //               //         icon: Image.asset('assets/images/google_logo1.png'),
// // //               //         iconSize: size.width * 0.052,  // Reduced size
// // //               //         onPressed: () {},
// // //               //       ),
// // //               //     ),
// // //               //     SizedBox(width: size.width * 0.05),
// // //               //     Flexible(
// // //               //       child: IconButton(
// // //               //         icon: Image.asset('assets/images/apple_logo.png'),
// // //               //         iconSize: size.width * 0.001,  // Reduced size
// // //               //         onPressed: () {},
// // //               //       ),
// // //               //     ),
// // //               //   ],
// // //               // ),
// // //               Row(
// // //   mainAxisAlignment: MainAxisAlignment.center,
// // //   children: [
// // //     // Google Logo Button
// // //     SizedBox(
// // //       width: size.width * 0.2, // Adjust width to make it smaller
// // //       height: size.width * 0.2, // Adjust height proportionally
// // //       child: IconButton(
// // //         icon: Image.asset('assets/images/google_logo1.png'),
// // //         onPressed: () {},
// // //       ),
// // //     ),
// // //     SizedBox(width: size.width * 0.05),
// // //     // Apple Logo Button
// // //     SizedBox(
// // //       width: size.width * 0.2, // Adjust width to make it smaller
// // //       height: size.width * 0.2, // Adjust height proportionally
// // //       child: IconButton(
// // //         icon: Image.asset('assets/images/apple_logo.png'),
// // //         onPressed: () {},
// // //       ),
// // //     ),
// // //   ],
// // // ),
// // //               SizedBox(height: size.height * 0.02),  // Reduced space
// // //               // Already Have Account
// // //               Center(
// // //                 child: RichText(
// // //                   text: TextSpan(
// // //                     text: "Already have an account? ",
// // //                     style: TextStyle(color: Colors.black),
// // //                     children: [
// // //                       TextSpan(
// // //                         text: "Login",
// // //                         style: TextStyle(color: Colors.blue),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(height: size.height * 0.03),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // Helper Widget for Label Text
// // //   Widget _buildLabel(String text, Size size) {
// // //     return Text(
// // //       text,
// // //       style: TextStyle(
// // //         fontSize: size.width * 0.04,  // Reduced font size
// // //         fontWeight: FontWeight.w500,
// // //         color: Colors.black,
// // //       ),
// // //     );
// // //   }
// // // }




// // import 'package:flutter/gestures.dart';
// // import 'package:flutter/material.dart';

// // import 'package:provider/provider.dart';
// // import 'package:time_sheet_app/model/registration_model.dart';
// // import 'package:time_sheet_app/provider/registration_provider.dart';
// // import 'package:time_sheet_app/view/home_page.dart';
// // import 'package:time_sheet_app/view/login_page.dart';

// // class RegistrationPage extends StatelessWidget {
// // final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController phoneController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController confirmPasswordController =
// //       TextEditingController();
// // void register(BuildContext context) async {
// //     final provider = Provider.of<RegistrationProvider>(context, listen: false);

// //     final model = RegistrationModel(
// //       username: emailController.text,
// //       password: passwordController.text,
// //       confirmPassword: confirmPasswordController.text,
// //       name: nameController.text,
// //       email: emailController.text,
// //       phoneNumber: phoneController.text,
// //     );

// //     final success = await provider.registerUser(model);

// //     if (success) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Registration Successful")),
// //       );

// //       // Navigate to the home screen
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //             builder: (context) =>
// //                 HomePage()), // Replace `HomePage` with your home screen widget
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text(provider.errorMessage)),
// //       );
// //     }
// //   }


// //   // void register(BuildContext context) async {
// //   //   final provider = Provider.of<RegistrationProvider>(context, listen: false);

// //   //   final model = RegistrationModel(
// //   //     username: emailController.text,
// //   //     password: passwordController.text,
// //   //     confirmPassword: confirmPasswordController.text,
// //   //     name: nameController.text,
// //   //     email: emailController.text,
// //   //     phoneNumber: phoneController.text,
// //   //   );

// //   //   final success = await provider.registerUser(model);

// //   //   if (success) {
// //   //     ScaffoldMessenger.of(context).showSnackBar(
// //   //       SnackBar(content: Text("Registration Successful")),
// //   //     );
// //   //   } else {
// //   //     ScaffoldMessenger.of(context).showSnackBar(
// //   //       SnackBar(content: Text(provider.errorMessage)),
// //   //     );
// //   //   }
// //   // }

// //   @override
// //    Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;
// //  final provider = Provider.of<RegistrationProvider>(context);

// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               SizedBox(height: size.height * 0.05), // Reduced space
// //               // Logo
// //               Center(
// //                 child: Text(
// //                   "Logo",
// //                   style: TextStyle(
// //                     fontSize: size.width * 0.08, // Reduced font size
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.02),
// //               // Title
// //               Text(
// //                 "Register us",
// //                 style: TextStyle(
// //                   fontSize: size.width * 0.05, // Reduced font size
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.01),
// //               Text(
// //                 "Create your new account",
// //                 style: TextStyle(
// //                   fontSize: size.width * 0.04, // Reduced font size
// //                   color: Colors.grey,
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.02), // Reduced space
// //               // Name Field
// //               _buildLabel("Name", size),
// //               TextField(
// //                 controller: nameController,
// //                 decoration: InputDecoration(
// //                   prefixIcon: Icon(Icons.person),
// //                   hintText: "name",
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.015), // Reduced space
// //               // Email Field
// //               _buildLabel("Email", size),
// //               TextField(
// //                 controller: emailController,
// //                 decoration: InputDecoration(
// //                   prefixIcon: Icon(Icons.email),
// //                   hintText: "name@example.com",
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.015), // Reduced space
// //               // Password Field
// //               _buildLabel("Password", size),
// //               TextField(
// //                 controller: passwordController,
// //                 obscureText: true,
// //                 decoration: InputDecoration(
// //                   prefixIcon: Icon(Icons.lock),
// //                   suffixIcon: Icon(Icons.visibility),
// //                   hintText: "at least 8 characters",
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.015), // Reduced space
// //               // Confirm Password Field
// //               _buildLabel("Confirm Password", size),
// //               TextField(
// //                 controller: confirmPasswordController,
// //                 obscureText: true,
// //                 decoration: InputDecoration(
// //                   prefixIcon: Icon(Icons.lock),
// //                   suffixIcon: Icon(Icons.visibility),
// //                   hintText: "at least 8 characters",
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.015), // Reduced space
// //               // Remember me Checkbox
// //               Row(
// //                 children: [
// //                   Checkbox(
// //                     value: true,
// //                     onChanged: (value) {},
// //                   ),
// //                   Text("Remember me"),
// //                 ],
// //               ),
// //               SizedBox(height: size.height * 0.015), // Reduced space
// //               // Register Button
                
              
// //               Center(
// //                 child: provider.isLoading
// //                   ? CircularProgressIndicator() : ElevatedButton(
// //                onPressed: () => register(context),
// //                   style: ElevatedButton.styleFrom(
// //                     minimumSize: Size(size.width * 0.8, size.height * 0.06),
// //                     backgroundColor: Colors.purple,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.zero,
// //                     ),
// //                   ),
// //                   child: Text(
// //                     "Register",
// //                     style: TextStyle(
// //                       fontSize: size.width * 0.04, // Reduced font size
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.02), // Reduced space
// //               // Divider with Text
// //               Row(
// //                 children: [
// //                   Expanded(child: Divider(color: Colors.grey)),
// //                   Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                     child: Text("Or continue with"),
// //                   ),
// //                   Expanded(child: Divider(color: Colors.grey)),
// //                 ],
// //               ),
// //               SizedBox(height: size.height * 0.02), // Reduced space
// //               // Social Media Buttons
// //               // Row(
// //               //   mainAxisAlignment: MainAxisAlignment.center,
// //               //   children: [
// //               //     Flexible(
// //               //       child: IconButton(
// //               //         icon: Image.asset('assets/images/google_logo1.png'),
// //               //         iconSize: size.width * 0.052,  // Reduced size
// //               //         onPressed: () {},
// //               //       ),
// //               //     ),
// //               //     SizedBox(width: size.width * 0.05),
// //               //     Flexible(
// //               //       child: IconButton(
// //               //         icon: Image.asset('assets/images/apple_logo.png'),
// //               //         iconSize: size.width * 0.001,  // Reduced size
// //               //         onPressed: () {},
// //               //       ),
// //               //     ),
// //               //   ],
// //               // ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   // Google Logo Button
// //                   SizedBox(
// //                     width: size.width * 0.2, // Adjust width to make it smaller
// //                     height: size.width * 0.2, // Adjust height proportionally
// //                     child: IconButton(
// //                       icon: Image.asset('assets/images/google_logo1.png'),
// //                       onPressed: () {},
// //                     ),
// //                   ),
// //                   SizedBox(width: size.width * 0.05),
// //                   // Apple Logo Button
// //                   SizedBox(
// //                     width: size.width * 0.2, // Adjust width to make it smaller
// //                     height: size.width * 0.2, // Adjust height proportionally
// //                     child: IconButton(
// //                       icon: Image.asset('assets/images/apple_logo.png'),
// //                       onPressed: () {},
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(height: size.height * 0.02), // Reduced space
// //               // Already Have Account

// //               Center(
// //                 child: RichText(
// //                   text: TextSpan(
// //                     text: "Already have an account? ",
// //                     style: TextStyle(color: Colors.black),
// //                     children: [
// //                       TextSpan(
// //                         text: "Login",
// //                         style: TextStyle(color: Colors.blue),
// //                         recognizer: TapGestureRecognizer()
// //             ..onTap = () {
// //               // Navigate to the Register Page
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => LoginPage()),
// //               );
// //             }
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: size.height * 0.03),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // Helper Widget for Label Text
// //   Widget _buildLabel(String text, Size size) {
// //     return Text(
// //       text,
// //       style: TextStyle(
// //         fontSize: size.width * 0.04, // Reduced font size
// //         fontWeight: FontWeight.w500,
// //         color: Colors.black,
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:time_sheet_app/model/registration_model.dart';
// import 'package:time_sheet_app/provider/registration_provider.dart';
// import 'package:time_sheet_app/view/home_page.dart';
// import 'package:time_sheet_app/view/login_page.dart';

// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   bool isPasswordVisible = false;
//   bool isConfirmPasswordVisible = false;

//   void togglePasswordVisibility() {
//     setState(() {
//       isPasswordVisible = !isPasswordVisible;
//     });
//   }

//   void toggleConfirmPasswordVisibility() {
//     setState(() {
//       isConfirmPasswordVisible = !isConfirmPasswordVisible;
//     });
//   }

//   void register(BuildContext context) async {
//     final provider = Provider.of<RegistrationProvider>(context, listen: false);

//     final model = RegistrationModel(
//       username: emailController.text,
//       password: passwordController.text,
//       confirmPassword: confirmPasswordController.text,
//       name: nameController.text,
//       email: emailController.text,
//       phoneNumber: phoneController.text,
//     );

//     final success = await provider.registerUser(model);

//     if (success) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Registration Successful")),
//       );

//       // Navigate to the home screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomePage()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(provider.errorMessage)),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final provider = Provider.of<RegistrationProvider>(context);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: size.height * 0.05),
//               Center(
//                 child: Text(
//                   "Logo",
//                   style: TextStyle(
//                     fontSize: size.width * 0.08,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
//               Text(
//                 "Register us",
//                 style: TextStyle(
//                   fontSize: size.width * 0.05,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: size.height * 0.01),
//               Text(
//                 "Create your new account",
//                 style: TextStyle(
//                   fontSize: size.width * 0.04,
//                   color: Colors.grey,
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
//               _buildLabel("Name", size),
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person),
//                   hintText: "name",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.015),
//               _buildLabel("Email", size),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.email),
//                   hintText: "name@example.com",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.015),
//               _buildLabel("Password", size),
//               TextField(
//                 controller: passwordController,
//                 obscureText: !isPasswordVisible,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: togglePasswordVisibility,
//                   ),
//                   hintText: "at least 8 characters",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.015),
//               _buildLabel("Confirm Password", size),
//               TextField(
//                 controller: confirmPasswordController,
//                 obscureText: !isConfirmPasswordVisible,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isConfirmPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: toggleConfirmPasswordVisibility,
//                   ),
//                   hintText: "at least 8 characters",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.015),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: true,
//                     onChanged: (value) {},
//                   ),
//                   Text("Remember me"),
//                 ],
//               ),
//               SizedBox(height: size.height * 0.015),
//               Center(
//                 child: provider.isLoading
//                     ? CircularProgressIndicator()
//                     : ElevatedButton(
//                         onPressed: () => register(context),
//                         style: ElevatedButton.styleFrom(
//                           minimumSize:
//                               Size(size.width * 0.8, size.height * 0.06),
//                           backgroundColor: Colors.purple,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.zero,
//                           ),
//                         ),
//                         child: Text(
//                           "Register",
//                           style: TextStyle(
//                             fontSize: size.width * 0.04,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//               ),
//               SizedBox(height: size.height * 0.02),
//               Row(
//                 children: [
//                   Expanded(child: Divider(color: Colors.grey)),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text("Or continue with"),
//                   ),
//                   Expanded(child: Divider(color: Colors.grey)),
//                 ],
//               ),
//               SizedBox(height: size.height * 0.02),
//               Center(
//                 child: RichText(
//                   text: TextSpan(
//                     text: "Already have an account? ",
//                     style: TextStyle(color: Colors.black),
//                     children: [
//                       TextSpan(
//                         text: "Login",
//                         style: TextStyle(color: Colors.blue),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => LoginPage(),
//                               ),
//                             );
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.03),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLabel(String text, Size size) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: size.width * 0.04,
//         fontWeight: FontWeight.w500,
//         color: Colors.black,
//       ),
//     );
//   }
// }



import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_sheet_app/model/registration_model.dart';
import 'package:time_sheet_app/provider/registration_provider.dart';
import 'package:time_sheet_app/view/home_page.dart';
import 'package:time_sheet_app/view/login_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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

  void register(BuildContext context) async {
    final provider = Provider.of<RegistrationProvider>(context, listen: false);

    final model = RegistrationModel(
      username: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      name: nameController.text,
      email: emailController.text,
      phoneNumber: phoneController.text,
    );

    final success = await provider.registerUser(model);

    if (success) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', model.email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration Successful")),
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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<RegistrationProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                child: provider.isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () => register(context),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(size.width * 0.8, size.height * 0.06),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
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
