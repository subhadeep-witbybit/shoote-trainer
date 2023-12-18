import 'package:shooter_demo/models/enums.dart';

class ShooterRouterInfo {
  final PageName pageName;
  final String path;
  final int? selectedId;

  ShooterRouterInfo.list()
      : pageName = PageName.list,
        selectedId = null,
        path = '/';

  ShooterRouterInfo.details(int parse, {this.selectedId})
      : pageName = PageName.details,
        path = '/school';

  ShooterRouterInfo.unknown()
      : pageName = PageName.unknwon,
        selectedId = null,
        path = '/404/';
}
