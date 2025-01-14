import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:time_sheet_app/common/shared_pref_provider.dart';
import 'package:time_sheet_app/const/router.dart';
import 'package:time_sheet_app/utils/assest/images.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      bool isLoggedIn =
          await ref.read(sharedPrefServicesProvider).isUserLoggedIn();

      if (isLoggedIn) {
        if (mounted) {
          context.go(AppRouter.home);
        }
        return;
      }

      if (mounted) {
        context.go(AppRouter.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Center(child: Image.asset(AppImages.luncherIcon, height: 150)),
          Text("TimeSheet",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(letterSpacing: 0.5, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
