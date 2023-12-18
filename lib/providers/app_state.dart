import 'package:flutter/material.dart';
import 'package:shooter_demo/models/school_model.dart';
import '../models/enums.dart';

class AppState extends ChangeNotifier {
  final List<ShootingSchool> shootingSchools = [
    ShootingSchool(id: 0, availableTypes: [ShootingSchoolType.pistol]),
    ShootingSchool(id: 1, availableTypes: [ShootingSchoolType.shotgun]),
    ShootingSchool(
        id: 2,
        availableTypes: [ShootingSchoolType.sniper, ShootingSchoolType.rifle]),
    ShootingSchool(id: 3, availableTypes: [
      ShootingSchoolType.pistol,
      ShootingSchoolType.rifle,
      ShootingSchoolType.shotgun
    ]),
    ShootingSchool(id: 4, availableTypes: [
      ShootingSchoolType.pistol,
      ShootingSchoolType.sniper,
      ShootingSchoolType.shotgun,
      ShootingSchoolType.sniper
    ]),
  ];

  int? _selectedSchool;

  int? get selectedSchool => _selectedSchool;
  void setSelectedSchool(int? selectedIndex) {
    _selectedSchool = selectedIndex;
    notifyListeners();
  }

  int sniperShots = 0;
  int pistolShots = 0;
  int rifleShots = 0;
  int shotgunShots = 0;

  void setSniperShots(int shots) {
    print('Sniper');
    sniperShots = shots;
    notifyListeners();
  }

  void setPistolShots(int shots) {
    print('Pistol');
    pistolShots = shots;
    notifyListeners();
  }

  void setRifleShots(int shots) {
    print('Rifle');
    rifleShots = shots;
    notifyListeners();
  }

  void setShotgunShots(int shots) {
    print('Shotgun');
    shotgunShots = shots;
    notifyListeners();
  }
}
