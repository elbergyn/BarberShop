import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/ui/barbershop_nav_global_key.dart';
import 'package:barbershop/src/core/ui/barbershop_theme.dart';
import 'package:barbershop/src/core/ui/constants.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/auth/barbershop/barbershop_register_page.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/auth/user/user_register_page.dart';
import 'package:barbershop/src/features/employee/register/employee_register_page.dart';
import 'package:barbershop/src/features/employee/schedule/employee_schedule_page.dart';
import 'package:barbershop/src/features/home/employee/home_employee_page.dart';
import 'package:barbershop/src/features/home/widgets/home_adm_page.dart';
import 'package:barbershop/src/features/schedule/schedule_page.dart';
import 'package:barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (navigatorObserver) => MaterialApp(
        navigatorObservers: [navigatorObserver],
        title: 'DW Barbershop',
        theme: BarbershopTheme.themeData,
        navigatorKey: BarbershopNavGlobalKey.instance.navKey,
        routes: {
          '/': (_) => const SplashPage(),
          RouteConstants.login: (_) => const LoginPage(),
          RouteConstants.registerUser: (_) => const UserRegisterPage(),
          RouteConstants.registerBarberShop: (_) =>
              const BarbershopRegisterPage(),
          RouteConstants.homeAdm: (_) => const HomeAdmPage(),
          RouteConstants.homeEmployee: (_) => const HomeEmployeePage(),
          RouteConstants.registerEmployee: (_) => const EmployeeRegisterPage(),
          RouteConstants.employeeSchedulePage: (_) =>
              const EmployeeSchedulePage(),
          RouteConstants.schedulePage: (_) => const SchedulePage()
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt','BR')],
        locale: const Locale('pt','BR'),
      ),
    );
  }
}
