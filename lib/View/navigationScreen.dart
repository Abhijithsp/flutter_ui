import 'package:flutter/material.dart';

import 'Dashboard/HealthCareDashboard.dart';
import 'Dashboard/ServiceDashboardView.dart';


class navigationScreen extends StatefulWidget {
  const navigationScreen({Key? key}) : super(key: key);

  @override
  State<navigationScreen> createState() => _navigationScreenState();
}

class _navigationScreenState extends State<navigationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("Abhijithsp"),
            accountEmail: const Text("abhijithsp1@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor:
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: const Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HealthCareDashboard(),
                ),
              );
            },
            child: Container(
              color: Colors.black12,
              child: ListTile(
                leading: Icon(Icons.local_hospital_rounded,
                    color: Colors.orangeAccent[400], size: 30),
                title: const Text(
                  "HealthCare",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDashboardView(),
                ),
              );
            },
            child: Container(
              color: Colors.black12,
              child: ListTile(
                leading: Icon(Icons.security,
                    color: Colors.orangeAccent[400], size: 30),
                title: const Text(
                  "ServiceDashboard",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ]),
    ));
  }
}
