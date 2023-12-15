class ShooterRouterConfig {
  final int? id;
  final String? selectedSchool;
  final String? selectedRoute;

  ShooterRouterConfig.list()
    :selectedRoute = null,
    selectedSchool = null,
    id = null

  bool get isListPage => selectedRoute == null && selectedSchool == null;
}