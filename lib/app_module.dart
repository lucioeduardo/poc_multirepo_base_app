import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:splash/splash.dart';

class AppModule extends MainModule {
  @override
  List<BaseModule> get modules => [
        SplashModule(),
        LoginModule(),
        HomeModule(),
      ];

  @override
  Future<void> registerGlobalInjections() async {
    instance.registerLazySingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>.new,
    );
    instance.registerLazySingleton<AppNavigator>(
      () => AppNavigatorImpl(navigatorKey: instance()),
    );
  }

  @override
  List<AppRoute> get routes => [];
}
