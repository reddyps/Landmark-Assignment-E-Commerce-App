import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:landmark_assignment/core/di/di.dart';
import 'package:landmark_assignment/core/firebase/firebase_handler.dart';
import 'package:landmark_assignment/core/navigation/routes.dart';
import 'package:landmark_assignment/core/util/theme/app_theme.dart';
import 'package:landmark_assignment/core/util/value/size_config.dart';
import 'package:landmark_assignment/l10n/app_localizations.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initilizeFirebase();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().initialize(context);
    return MaterialApp(
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      home: Routes.onBoardScreen,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme(context),
      themeMode: ThemeMode.light,
    );
  }
}

