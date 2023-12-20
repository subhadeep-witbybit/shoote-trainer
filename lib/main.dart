import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shooter_demo/providers/app_state.dart';
import 'package:shooter_demo/providers/localization_provider.dart';
import 'package:shooter_demo/routes/router_delegate.dart';
import 'package:shooter_demo/routes/router_parser.dart';

void mainApp(String localeCode) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppState()),
      ChangeNotifierProvider(
          create: (_) =>
              LocalizationsProvider.defaultLocale(localeCode: localeCode))
    ],
    child: const ShooterApp(),
  ));
}

class ShooterApp extends StatefulWidget {
  const ShooterApp({Key? key}) : super(key: key);

  @override
  State<ShooterApp> createState() => _ShooterAppState();
}

class _ShooterAppState extends State<ShooterApp> {
  late AppState _appState;
  late LocalizationsProvider _localizationsProvider;
  late ShooterRouterDelegate routerDelegate;
  final routerInformationParser = ShooterRouterParser();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _appState = Provider.of<AppState>(context);
    _localizationsProvider = Provider.of<LocalizationsProvider>(context);
    routerDelegate = ShooterRouterDelegate(appState: _appState);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shooter',
      debugShowCheckedModeBanner: false,
      locale: _localizationsProvider.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('en'), Locale('hi')],
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: routerInformationParser,
      routerDelegate: routerDelegate,
    );
  }
}
