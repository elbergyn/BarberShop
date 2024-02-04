import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/ui/barbershop_nav_global_key.dart';
import 'package:barbershop/src/core/ui/barbershop_theme.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/auth/register/user/barbershop/barbershop_register_page.dart';
import 'package:barbershop/src/features/auth/register/user/user_register_page.dart';
import 'package:barbershop/src/features/splash_page.dart';
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
            '/auth/login': (_) => const LoginPage(),
            '/auth/register/user': (_) => const UserRegisterPage(),
            '/auth/register/barbershop': (_) => const BarbershopRegisterPage(),
            '/home/admin': (_) => const Text('Adm'),
            '/home/employee': (_) => const Text('Employee'),
          },
      ),
    );
  }
}
