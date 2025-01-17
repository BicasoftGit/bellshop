// @dart=2.9

import 'providers/providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'helpers/helpers.dart';
import 'pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: MyApp(),
      path: 'resources',
      saveLocale: true,
      supportedLocales: [
        Locale('en', 'EN'),
        Locale('id', 'ID'),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeChangerProvider()),
      ],
      child: Consumer<ThemeChangerProvider>(
        builder: (context, theme, child) {
          return GetMaterialApp(
            title: 'Bellcommerce',
            defaultTransition: Transition.topLevel,
            transitionDuration: Duration(milliseconds: 800),
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            darkTheme: darkThemeData(context),
            themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: SplashPage(),
          );
        },
      ),
    );
  }
}
