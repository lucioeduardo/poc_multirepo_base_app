import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _navigatorKey =
      InjectionContainer.instance<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
    );

    return MaterialApp(
      title: 'Base Project',
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      theme: AppTheme.defaultThemeData,
      initialRoute: AppRoutes.splashPage,
      onGenerateRoute: (settings) {
        final route = AppRoutes.findRoute(name: settings.name ?? '');

        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (context) =>
              route.child(AppRouteArguments(settings.arguments)),
        );
      },
    );
  }
}
