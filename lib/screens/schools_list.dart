import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shooter_demo/providers/app_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shooter_demo/providers/localization_provider.dart';

class ShootingSchoolsList extends StatefulWidget {
  const ShootingSchoolsList({Key? key}) : super(key: key);
  @override
  State<ShootingSchoolsList> createState() => _ShootingSchoolsListState();
}

class _ShootingSchoolsListState extends State<ShootingSchoolsList> {
  late AppState _appState;
  late LocalizationsProvider _localizationsProvider;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _appState = Provider.of<AppState>(context);
    _localizationsProvider = Provider.of<LocalizationsProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 1,
        title: Text(
          AppLocalizations.of(context)!.shootingSchool,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          AnimatedToggleSwitch.dual(
            current: _localizationsProvider.locale!.languageCode,
            first: 'en',
            second: 'hi',
            onChanged: (index) {
              if (index == 'hi') {
                setState(() {
                  _localizationsProvider.setLocale(const Locale('en'));
                });
              } else {
                setState(() {
                  _localizationsProvider.setLocale(const Locale('hi'));
                });
              }
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 62, 186),
                border:
                    Border.all(color: const Color.fromARGB(255, 94, 26, 197)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Sniper Shots',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _appState.sniperShots.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: Colors.lightBlue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Pistol Shots',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _appState.pistolShots.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: Colors.lightBlue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Rifle Shots',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _appState.rifleShots.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: Colors.lightBlue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Shotgun Shots',
                              key: Key('shotgun_shots'),
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _appState.shotgunShots.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                  color: Colors.lightBlue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _appState.shootingSchools.length,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          _appState.setSelectedSchool(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 207, 189, 189)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shooting School ${_appState.shootingSchools[index].id + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                      height: 30,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: _appState
                                            .shootingSchools[index]
                                            .availableTypes
                                            .length,
                                        itemBuilder: (context, i) => Container(
                                          width: 30,
                                          height: 30,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 81, 44, 44)),
                                            image: DecorationImage(
                                              scale: 0.2,
                                              image: AssetImage(
                                                  'guns/${_appState.shootingSchools[index].availableTypes[i].toString().split('.').last}.png'),
                                              fit: BoxFit.contain,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              IconButton(
                                  tooltip: 'Train here',
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
