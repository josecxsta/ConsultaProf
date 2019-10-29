import 'package:catcher/core/catcher.dart';
import 'package:consulta_prof/blocs/application/application_bloc.dart';
import 'package:consulta_prof/blocs/application/application_event.dart';
import 'package:consulta_prof/blocs/application/application_state.dart';
import 'package:consulta_prof/screens/login/login_screen.dart';
import 'package:consulta_prof/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultaProfApp extends StatefulWidget {
  @override
  _ConsultaProfAppState createState() => _ConsultaProfAppState();
}

class _ConsultaProfAppState extends State<ConsultaProfApp> {
  ApplicationBloc _appBloc;
  @override
  void initState() {
    super.initState();
    _appBloc = ApplicationBloc();
    _appBloc.add(ApplicationStartEvent());
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider<ApplicationBloc>(
        builder: (BuildContext context) => _appBloc),

    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Catcher.navigatorKey,
      title: "Consulta Prof",
      supportedLocales : [
        const  Locale ('pt'),
      ],
      home: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
          if (state.isInitializing) {
            return SplashScreen();
          }

          if (!state.isAuthenticated) {
            return LoginScreen();
          }
          return Container();
        },
      ),
    ),
    );
  }
}
