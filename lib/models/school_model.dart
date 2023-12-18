import 'package:shooter_demo/models/enums.dart';

class ShootingSchool {
  final int id;
  final List<ShootingSchoolType> availableTypes;
  ShootingSchool({required this.availableTypes, required this.id});
}