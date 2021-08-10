import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../model/models.dart';
import '../screens.dart';

class PanelCenterPage extends StatelessWidget {
  final List<Person> _personList = [
    Person(name: "Ishwor Panta", color: Constants.orangeLight),
    Person(name: "Hari Prasad Panta", color: Colors.lightBlueAccent),
    Person(name: "Shiva Panta", color: Colors.deepOrange),
    Person(name: "Ramhari Panta", color: Colors.green),
    Person(name: "Sita Panta", color: Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                child: Container(
                  width: double.infinity,
                  child: const ListTile(
                    title: Text(
                      "Product Available",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "80% of Products Available",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        "20,500",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //middle chart
            BarChartSample2(),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
                bottom: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purpleLight,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      _personList.length,
                      (index) {
                        final person = _personList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 15,
                            backgroundColor: person.color,
                            child: Text(
                              person.name.substring(0, 1),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            person.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
