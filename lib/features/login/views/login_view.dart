// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:time_sheet_app/const/router.dart';
// import 'package:time_sheet_app/features/login/model/user_login_model.dart';
// import 'package:time_sheet_app/features/login/provider/login_provider.dart';
// import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

// class LoginView extends ConsumerStatefulWidget {
//   const LoginView({super.key});

//   @override
//   ConsumerState<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends ConsumerState<LoginView> {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final isLoading = ref.watch(loginProvider);
//     final loginController = ref.read(loginProvider.notifier);

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: size.height * 0.15),
//               Center(
//                 child: Text(
//                   "Logo",
//                   style: TextStyle(
//                     fontSize: size.width * 0.1,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.10),
//               Text(
//                 "Welcome Back",
//                 style: TextStyle(
//                   fontSize: size.width * 0.06,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               SizedBox(height: size.height * 0.03),
//               _buildLabel("Email", size),
//               TextField(
//                 controller: usernameController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person),
//                   hintText: "Email",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
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
//                     onPressed: () {
//                       setState(() {
//                         isPasswordVisible = !isPasswordVisible;
//                       });
//                     },
//                   ),
//                   hintText: "at least 8 characters",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               SizedBox(height: size.height * 0.03),
//               Center(
//                 child: isLoading
//                     ? CircularProgressIndicator()
//                     : ElevatedButton(
//                         onPressed: () async {
//                           final email = usernameController.text.trim();
//                           final password = passwordController.text.trim();
//                           if (email.isEmpty || password.isEmpty) {
//                             showErrorSnackbar(
//                                 message: "Please fill in all fields to login",
//                                 context: context);
//                             return;
//                           }
            
//                           UserLoginModel userData = UserLoginModel(
//                               username: email, password: password);
//                           print("hi");
//                           loginController.loginUser(
//                               context: context, loginData: userData);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize:
//                               Size(size.width * 0.8, size.height * 0.06),
//                           backgroundColor: Colors.purple,
//                         ),
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: size.width * 0.045,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//               ),
//               // SizedBox(height: size.height * 0.10),
//               // Center(
//               //   child: RichText(
//               //     text: TextSpan(
//               //       text: "Don't have an account? ",
//               //       style: TextStyle(color: Colors.black),
//               //       children: [
//               //         TextSpan(
//               //           text: "Register",
//               //           style: TextStyle(color: Colors.blue),
//               //           recognizer: TapGestureRecognizer()
//               //             ..onTap = () {
//               //               context.go(AppRouter.register);
//               //             },
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
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
//         fontSize: size.width * 0.045,
//         fontWeight: FontWeight.w500,
//         color: Colors.black,
//       ),
//     );
//   }
// }




import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/const/router.dart';
import 'package:time_sheet_app/features/login/model/user_login_model.dart';
import 'package:time_sheet_app/features/login/provider/login_provider.dart';
import 'package:time_sheet_app/utils/const/helpers/snackbars/error_snackbar.dart';

class LocationService {
  static Future<Position?> requestLocationPermission(
      BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enable location services.")),
      );
      return null;
    }

    // Check and request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission denied.")),
        );
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Location permission permanently denied.")),
      );
      return null;
    }

    // Get the current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: SingleChildScrollView(
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
              _buildLabel("Email", size),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: "Email",
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
                  prefixIcon: const Icon(Icons.lock),
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
                  hintText: "At least 8 characters",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          final email = usernameController.text.trim();
                          final password = passwordController.text.trim();

                          if (email.isEmpty || password.isEmpty) {
                            showErrorSnackbar(
                              message: "Please fill in all fields to login",
                              context: context,
                            );
                            return;
                          }

                          try {
                            // Fetch location details
                            final position =
                                await LocationService.requestLocationPermission(
                                    context);

                            if (position == null) {
                              showErrorSnackbar(
                                message:
                                    "Unable to fetch location. Please enable permissions.",
                                context: context,
                              );
                              return;
                            }

                            // Fetch additional location details
                            List<Placemark> placemarks =
                                await placemarkFromCoordinates(
                                    position.latitude, position.longitude);
                            Placemark place = placemarks.first;

                            // Create LoginModel
                            LoginModel userData = LoginModel(
                              username: email,
                              password: password,
                              activity: "Login",
                              currentLocation:
                                  "${place.street}, ${place.subLocality}, ${place.locality}",
                              currentLongitude: position.longitude,
                              currentLatitude: position.latitude,
                              state: place.administrativeArea ?? '',
                              city: place.locality ?? '',
                              street: place.street ?? '',
                              country: place.country ?? '',
                              postalCode: place.postalCode ?? '',
                            );
                            print(email);
                            print(password);
                            print(
                                "${place.street}, ${place.subLocality}, ${place.locality}");
                            print(position.longitude);
                            print(place.postalCode);
                            // Call login controller
                            loginController.loginUser(
                              context: context,
                              loginData: userData,
                            );
                          } catch (e) {
                            showErrorSnackbar(
                              message: "An error occurred: $e",
                              context: context,
                            );
                          }
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