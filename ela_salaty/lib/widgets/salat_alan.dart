import 'package:ela_salaty/models/salat_model.dart';
import 'package:flutter/material.dart';

class SalatAlan extends StatelessWidget {
  const SalatAlan({super.key, required this.salatAlan});


  final SalatModel salatAlan;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromARGB(15, 255, 193, 7),
      height: 400,
      width: 400,

      child: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(170, 0, 0, 0),
                  borderRadius: BorderRadius.circular(150),
                ),

                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        salatAlan.name,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      Text(
                        salatAlan.time,
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                      Text(
                        "03:30:55 :بقي",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF2F2F2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DateOfDay(date: "الثلاثاء: 6 محرم 1447"),

            ],
          ),
        ),
      ),
    );
  }
}

class DateOfDay extends StatelessWidget {
  const DateOfDay({
    super.key,
    required this.date,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(170, 0, 0, 0),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(170, 0, 0, 0),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
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
