import 'package:flutter/material.dart';
import 'package:shooter_demo/routes/router_config.dart';
import 'package:shooter_demo/screens/schools_list.dart';

class ShooterRouterDelegate extends RouterDelegate<ShooterRouterConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ShooterRouterConfig> {
  final GlobalKey<NavigatorState> navigatorKey;

  ShooterRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  void _init() {
    _navigator = Navigator(
      key: navigatorKey,
      pages: const [
        MaterialPage(
          key: ValueKey('ShootingSchoolsList'),
          child: ShootingSchoolsList(),
        ),
        
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        return true;
      },
    );
  }

  late Navigator _navigator;

  @override
  Widget build(BuildContext context) {
    return _navigator;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    