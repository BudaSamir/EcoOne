// ignore_for_file: prefer_const_constructors

import 'package:eco_one/presentation/forgot_password/forgot_password_view.dart';
import 'package:eco_one/presentation/login/login_view.dart';
import 'package:eco_one/presentation/main/main_view.dart';
import 'package:eco_one/presentation/register/register_view.dart';
import 'package:eco_one/presentation/splash/splash_view.dart';
import 'package:eco_one/presentation/store_deteils/store_details_view.dart';
import 'package:flutter/material.dart';

class Roustes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailRoute = "/storeDetails";
}

class RouteGenerator {
  // Method to Return The Selected Route
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Roustes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Roustes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Roustes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Roustes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Roustes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Roustes.storeDetailRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: Center(
                child: const Text("No Route Found"),
              ),
            ));
  }
}
