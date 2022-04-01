import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'HealthcareDetails.dart';

class HealthItemview extends StatefulWidget {
  @override
  _HealthItemviewState createState() => _HealthItemviewState();
}

class _HealthItemviewState extends State<HealthItemview> {
  int SelectedToggle = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Lab Test",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellowAccent[100],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Image(
            //   image: AssetImage("assets/images/Cleaning7.jpg"),
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   fit: BoxFit.cover,
            // ),
            Column(
              children: [
                _Banner(),
                SizedBox(
                  height: 20,
                ),
                _HealthGrid(),
                FeaturesView(),
              ],
            ),
            _search(),
          ],
        ),
      ),
    ));
  }

  Widget _Banner() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 210,
      decoration: BoxDecoration(
        color: Colors.yellowAccent[100],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Now Test Easily"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eagna aliqua"),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ToggleSwitch(
                initialLabelIndex: 0,
                minWidth: 220.0,
                cornerRadius: 15.0,
                fontSize: 12.5,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.white,
                inactiveFgColor: Colors.grey,
                labels: ['Search', 'Upload Prescription'],
                icons: [Icons.search, Icons.upload_file],
                onToggle: (index) {
                  print('switched to: $index');
                }, totalSwitches: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 160, horizontal: 10),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: TextField(
            cursorColor: Theme.of(context).primaryColor,
            style: TextStyle(color: Colors.black, fontSize: 12),
            decoration: InputDecoration(
                hintText: " Search Your Preferences...",
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  top: 8, // HERE THE IMPORTANT PART
                )),
          ),
        ),
      ),
    );
  }

  Widget _HealthGrid() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 140;
    final double itemWidth = 150;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.transparent,
              height: size.height /2.1,
              width: size.width * 1.8,
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: (itemWidth / itemHeight),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthCareDetails()),
                        );
                      },
                      child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/health 2.png")),
                                  color: Colors.transparent,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "Lab Test  $index",
                                  style: TextStyle(fontSize: 12.5),
                                ),
                              )
                            ],
                          )),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget FeaturesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Features",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 90,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.book,
                    size: 30,
                    color: Colors.amber,
                  ),
                  Text("Easily"),
                  Text("Booking")
                ],
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.timer,
                    size: 30,
                    color: Colors.amber,
                  ),
                  Text("Fast"),
                  Text("Result")
                ],
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.trending_up_sharp,
                    size: 30,
                    color: Colors.amber,
                  ),
                  Text("100%"),
                  Text("Trusted Labs")
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
