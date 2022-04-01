import 'package:flutter/material.dart';


class ServiceDetailsList extends StatefulWidget {
  @override
  _ServiceDetailsListState createState() => _ServiceDetailsListState();
}

class _ServiceDetailsListState extends State<ServiceDetailsList> {
  int counter = 0;
  bool isAdded = false;
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context, true);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => ServiceView()),
            // );
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        title: Text(
          "SELECT SERVICE",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ServiceCategories(),
              Container(
                height: 50,
                width: size.width,
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Service $_selectedIndex",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              ServiceDetailsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ServiceCategories() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              width: size.width,
              child: ListView.separated(
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _onSelected(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: _selectedIndex != null &&
                                    _selectedIndex == index
                                ? Colors.yellowAccent[700]
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Services $index",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blueGrey[700])),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ServiceDetailsList() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: size.width,
        child: ListView.separated(
          itemCount: 15,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 90.0,
                              height: 80.0,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/Cleaning1.jpg")),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Service Name $index"),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: Row(
                            children: const [Text("Description")],
                          ),
                        ),
                        const Text("Rs 555 /-"),
                      ],
                    ),
                    Flexible(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            _settingModalBottomSheet(context, index.toString());
                          },
                          child: SizedBox(
                            height: 100,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 0,
                                  child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                        width: 60,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: Colors.yellow, width: 1.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.add,
                                              size: 15,
                                            ),
                                            Text("ADD",
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context, String index) {
    showModalBottomSheet(
        backgroundColor: Colors.white.withOpacity(0),
        barrierColor: Colors.white.withOpacity(0),
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: const EdgeInsets.all(60),
            child: Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blueAccent[700],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(index, style: TextStyle(color: Colors.white)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: VerticalDivider(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Rs 558",
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Next", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
