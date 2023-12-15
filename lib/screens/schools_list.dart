
import 'package:flutter/material.dart';
import 'package:shooter_demo/models/enums.dart';

class ShootingSchool {
  final int id;
  final List<ShootingSchoolType> availableTypes;
  ShootingSchool({required this.availableTypes, required this.id});
}

class ShootingSchoolsList extends StatefulWidget {
  const ShootingSchoolsList({Key? key}) : super(key: key);

  @override
  State<ShootingSchoolsList> createState() => _ShootingSchoolsListState();
}

class _ShootingSchoolsListState extends State<ShootingSchoolsList> {
  final List<ShootingSchool> _shootingSchools = [
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

  int sniperShots = 0;
  int pistolShots = 0;
  int rifleShots = 0;
  int shotgunShots = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 1,
        title: const Text(
          'Shooting Schools',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
                              sniperShots.toString(),
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
                              pistolShots.toString(),
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
                              rifleShots.toString(),
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
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              shotgunShots.toString(),
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
                itemCount: _shootingSchools.length,
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        border: Border.all(
                            color: const Color.fromARGB(255, 207, 189, 189)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shooting School ${_shootingSchools[index].id + 1}',
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
                                    itemCount: _shootingSchools[index]
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
                                              'guns/${_shootingSchools[index].availableTypes[i].toString().split('.').last}.png'),
                                          fit: BoxFit.contain,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          IconButton(
                              tooltip: 'Train here',
                              onPressed: () {
                                
                              },
                              icon: const Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}