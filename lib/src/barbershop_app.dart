import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/ui/barbershop_nav_global_key.dart';
import 'package:barbershop/src/core/ui/barbershop_theme.dart';
import 'package:barbershop/src/core/ui/constants.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/auth/barbershop/barbershop_register_page.dart';
import 'package:barbershop/src/features/auth/user/user_register_page.dart';
import 'package:barbershop/src/features/home/widgets/home_adm_page.dart';
import 'package:barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      loader: BarbershopLoader(),
      onError: (ErrorKit errorKit) {
        switch (errorKit.currentRoute) {
          case '/Root/HomeLoader/Detail':
            showDialog(
              context: errorKit.context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(errorKit.error.toString()),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Ok'),
                  )
                ],
              ),
            );
            break;
          case _:
            ScaffoldMessenger.of(errorKit.context).showSnackBar(
              SnackBar(
                content: Text(
                  errorKit.error.toString(),
                ),
              ),
            );
            break;
        }
      },

      builder: (navigatorObserver) => MaterialApp(
        navigatorObservers: [navigatorObserver],
        title: 'DW Barbershop',
        theme: BarbershopTheme.themeData,
        navigatorKey: BarbershopNavGlobalKey.instance.navKey,
        routes: {
            '/': (_) => const SplashPage(),
            RouteConstants.login: (_) => const LoginPage(),
            RouteConstants.registerUser: (_) => const UserRegisterPage(),
            RouteConstants.registerBarberShop: (_) => const BarbershopRegisterPage(),
            RouteConstants.homeAdm: (_) => const HomeAdmPage(),
            RouteConstants.homeEmployee: (_) => const Text('Employee'),
          },
      ),
    );
  }
}
