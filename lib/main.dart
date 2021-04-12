import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_auth/presentation/blocs/authentication/auth.dart';
import 'package:flutter_bloc_auth/presentation/journeys/auth/login.dart';
import 'package:flutter_bloc_auth/utils/router.dart';
import 'package:pedantic/pedantic.dart';
import 'package:flutter_bloc_auth/di/get_it.dart' as getIt;

import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'presentation/journeys/main/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) =>
      runApp(
          RepositoryProvider<UserRepository>(
              create: (context) => UserRepositoryImpl(dataSource: getIt.getItInstance()),
              child: BlocProvider<AuthenticationBloc>(
                create: (_){
                  final userRepo = RepositoryProvider.of<UserRepository>(_);
                  return AuthenticationBloc(userRepo)..add(AppStarted());
                },
                child: MyApp(),
              )
          )
      )
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akilah',
      theme: ThemeData(
        primaryColor: Color(0xffffc226),
        accentColor: Colors.blueAccent[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state){
            // print(state);
            if(state is AuthenticationStateAuthenticated) {
              return Home();
            }
            return LoginPage();
          }
      ),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }

}
