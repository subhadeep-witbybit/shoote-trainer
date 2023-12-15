import 'package:flutter/material.dart';

class SchoolsDetails extends StatefulWidget {
  @override
  _SchoolsDetailsState createState() => _SchoolsDetailsState();
}

class _SchoolsDetailsState extends State<SchoolsDetails> {
  int gun1ShotCount = 0;
  int gun2ShotCount = 0;
  int gun3ShotCount = 0;

  void increaseShotCount(int gunNumber) {
    setState(() {
      if (gunNumber == 1) {
        gun1ShotCount++;
      } else if (gunNumber == 2) {
        gun2ShotCount++;
      } else if (gunNumber == 3) {
        gun3ShotCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schools Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                increaseShotCount(1);
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Gun 1\nShot Count: $gun1ShotCount',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                increaseShotCount(2);
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    'Gun 2\nShot Count: $gun2ShotCount',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                increaseShotCount(3);
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    'Gun 3\nShot Count: $gun3ShotCount',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
