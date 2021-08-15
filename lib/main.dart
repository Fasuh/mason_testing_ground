import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mason_testing_ground/injection_container.dart';
import 'package:mason_testing_ground/app_config.dart';
import 'package:mason_testing_ground/core/navigator/navigator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer().init();
  AppConfig.init;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (routeSettings) => CustomNavigator.router.generator(routeSettings),
      navigatorKey: CustomNavigator.navigatorKey,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: BotToastInit(),
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
