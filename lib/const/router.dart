import 'package:go_router/go_router.dart';


import 'package:time_sheet_app/features/login/views/login_view.dart';
import 'package:time_sheet_app/features/register/views/register_view.dart';
import 'package:time_sheet_app/features/splash/view/splash_view.dart';

import 'package:time_sheet_app/view/home_page.dart';



class AppRouter {

   
 static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String project = '/project';
  static const String task = '/task';

  static GoRouter router = GoRouter(initialLocation:splash  , 
  routes: [
      GoRoute(
      path: splash,
      builder: (context, state) => SplashView(),
    ),
    GoRoute(
      path: login,
      builder: (context, state) => LoginView(),
    ),
     GoRoute(
      path: register,
      builder: (context, state) => RegisterView(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) =>  HomePage(),
    ),
   
  ]);
}
