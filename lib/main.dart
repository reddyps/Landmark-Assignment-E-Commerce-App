import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:landmark_assignment/core/di/di.dart';
import 'package:landmark_assignment/core/firebase/firebase_handler.dart';
import 'package:landmark_assignment/core/navigation/routes.dart';
import 'package:landmark_assignment/core/util/theme/app_theme.dart';
import 'package:landmark_assignment/core/util/value/size_config.dart';
import 'package:landmark_assignment/l10n/app_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initilizeFirebase();
  configureDependencies();
  Stripe.publishableKey =
  "pk_test_51LjocGK8ksAoxFf2T3BnkDu57BM1Kk0KEh5Y8iOOSNS3gH0liQx46AKTKh22UfOum4EtUC5pbHsnR5PfXbwJ2MtD00v11UEdVv";
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

