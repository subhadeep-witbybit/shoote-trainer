import 'package:flutter/material.dart';
import 'package:shooter_demo/providers/app_state.dart';
import 'package:shooter_demo/models/enums.dart';
import 'package:shooter_demo/routes/router_info.dart';
import 'package:shooter_demo/screens/schools_details.dart';
import 'package:shooter_demo/screens/schools_list.dart';

class ShooterRouterDelegate extends RouterDelegate<ShooterRouterInfo>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ShooterRouterInfo> {
  final AppState appState;
  ShooterRouterDelegate({required this.appState}) {
    _init();
  }
  void _init() {
    _navigator = Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(
          key: ValueKey('ShootingSchoolsList'),
          child: ShootingSchoolsList(),
        ),
        if (appState.selectedSchool != null)
          const MaterialPage(
              key: ValueKey('ShootingSchoolsDetails'),
              child: SchoolsDetails())
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  late Navigator _navigator;
  @override
  Widget build(BuildContext context) {
    return _navigator;
  }

  @override
  Future<void> setNewRoutePath(ShooterRouterInfo configuration) async {
    if (configuration.pageName == PageName.details) {
      appState.setSelectedSchool(configuration.selectedId!);
    } else if (configuration.pageName == PageName.list) {
      appState.setSelectedSchool(null);
    }
    return;
  }

  

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();
}
