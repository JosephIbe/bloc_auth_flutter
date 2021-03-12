import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/presentation/journeys/auth/forgot_password.dart';
import 'package:flutter_bloc_auth/presentation/journeys/auth/login.dart';
import 'package:flutter_bloc_auth/presentation/journeys/auth/register.dart';
import 'package:flutter_bloc_auth/presentation/journeys/auth/verify.dart';
import 'package:flutter_bloc_auth/presentation/journeys/auth/welcome.dart';
import 'package:flutter_bloc_auth/presentation/journeys/main/home.dart';
import 'package:flutter_bloc_auth/presentation/journeys/main/profile/profile.dart';
import 'package:flutter_bloc_auth/presentation/journeys/main/profile/profile_details.dart';
import 'package:flutter_bloc_auth/presentation/journeys/main/settings/app_settings.dart';
import 'package:flutter_bloc_auth/utils/strings.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => Welcome());
        break;
      case loginRoute:
        return MaterialPageRoute(builder: (_) =>
            LoginPage());
        break;
      case registerRoute:
        // return MaterialPageRoute(builder: (_) => RegisterNoBloc());
        return MaterialPageRoute(builder: (_) => RegisterPage());
        break;
      case forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPassword());
        break;
      case verifyOTPRoute:
        return MaterialPageRoute(builder: (_) => VerifyOTP());
        break;
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
        break;
      case profileRoute:
        return MaterialPageRoute(builder: (_) => Profile());
        break;
      case profileDetailsRoute:
        return MaterialPageRoute(builder: (_) => ProfileDetails());
        break;
      case appSettingsRoute:
        return MaterialPageRoute(builder: (_) => AppSettings());
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route specified for ${settings.name}'),
                  ),
                ));
    }
  }
}
