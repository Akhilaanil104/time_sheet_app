import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_sheet_app/provider/login_provider.dart';
import 'package:time_sheet_app/provider/registration_provider.dart';
import 'package:time_sheet_app/view/login_page.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegistrationProvider()),
             ChangeNotifierProvider(create: (_) => LoginProvider()),

        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
