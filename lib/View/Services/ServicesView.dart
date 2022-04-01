import 'package:flutter/material.dart';

import 'ServiceDetailsList/ServiceDetailsList.dart';



class ServiceView extends StatefulWidget {
  @override
  _ServiceViewState createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context, true);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        title: const Text(
          "SELECT SERVICE",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 25,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ServiceDetailsList()),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Cleaning2.jpg"),
                    radius: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Cleaning  $index"),
                  )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
