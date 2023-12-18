import 'package:flutter/material.dart';
import 'package:shooter_demo/models/enums.dart';
import 'package:shooter_demo/routes/router_info.dart';

class ShooterRouterParser extends RouteInformationParser<ShooterRouterInfo> {
  @override
  Future<ShooterRouterInfo> parseRouteInformation(
      RouteInformation routeInformation) async {
    print(routeInformation.uri.pathSegments);
    if (routeInformation.uri.path == '/') {
      return ShooterRouterInfo.list();
    } else if (routeInformation.uri.path.contains('/school/')) {
      print('===> ${routeInformation.uri}');
      return ShooterRouterInfo.details(
          int.parse(routeInformation.uri.pathSegments.last));
    }
    return ShooterRouterInfo.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(ShooterRouterInfo configuration) {
    print(configuration);
    if (configuration.pageName == PageName.list) {
      return RouteInformation(uri: Uri.parse('/'));
    } else {
      return RouteInformation(
        uri: Uri.parse(
          '/school/${configuration.selectedId}',
        ),
      );
    }
  }
}
