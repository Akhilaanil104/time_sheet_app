import 'package:go_router/go_router.dart';


import 'package:time_sheet_app/features/login/views/login_view.dart';

import 'package:time_sheet_app/view/home_page.dart';



class AppRoute {

   

  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String project = '/project';
  static const String task = '/task';

  static GoRouter router = GoRouter(initialLocation:login  , 
  routes: [

    GoRoute(
      path: login,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: home,
      builder: (context, state) =>  HomePage(),
    ),
   
  ]);
}
