import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shooter_demo/providers/app_state.dart';
import 'package:shooter_demo/models/enums.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class SchoolsDetails extends StatefulWidget {
  const SchoolsDetails({
    super.key,
  });
  @override
  State<SchoolsDetails> createState() => _SchoolsDetailsState();
}

class _SchoolsDetailsState extends State<SchoolsDetails> {
  late AppState _appState;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _appState = Provider.of<AppState>(context);
    super.didChangeDependencies();
  }

  String getWeaponName(ShootingSchoolType type) {
    if (type == ShootingSchoolType.pistol) {
      return AppLocalizations.of(context)!.pistol;
    } else if (type == ShootingSchoolType.rifle) {
      return AppLocalizations.of(context)!.rifle;
    } else if (type == ShootingSchoolType.shotgun) {
      return AppLocalizations.of(context)!.shotgun;
    } else {
      return AppLocalizations.of(context)!.sniper;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.trainingGround),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _appState
                      .shootingSchools[_appState.selectedSchool!]
                      .availableTypes
                      .length,
                  itemBuilder: (_, i) => Container(
                        width: 100,
                        margin: const EdgeInsets.all(13),
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            final type = _appState
                                .shootingSchools[_appState.selectedSchool!]
                                .availableTypes[i];
                            if (type == ShootingSchoolType.pistol) {
                              _appState
                                  .setPistolShots(_appState.pistolShots + 1);
                            } else if (type == ShootingSchoolType.rifle) {
                              _appState.setRifleShots(_appState.rifleShots + 1);
                            } else if (type == ShootingSchoolType.shotgun) {
                              _appState
                                  .setShotgunShots(_appState.shotgunShots + 1);
                            } else {
                              _appState
                                  .setSniperShots(_appState.sniperShots + 1);
                            }
                          },
                          child: Center(
                            child: Text(
                              getWeaponName(_appState
                                  .shootingSchools[_appState.selectedSchool!]
                                  .availableTypes[i]),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
