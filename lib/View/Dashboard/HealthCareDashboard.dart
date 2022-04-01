import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../Healthcare/HealthItemview.dart';
import '../navigationScreen.dart';

class HealthCareDashboard extends StatefulWidget {
  @override
  _HealthCareDashboardState createState() => _HealthCareDashboardState();
}

class _HealthCareDashboardState extends State<HealthCareDashboard> {
  final imageList = [
    'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246__480.jpg',
    'https://cdn.pixabay.com/photo/2016/11/20/09/06/bowl-1842294__480.jpg',
    'https://cdn.pixabay.com/photo/2017/01/03/11/33/pizza-1949183__480.jpg',
    'https://cdn.pixabay.com/photo/2017/02/03/03/54/burger-2034433__480.jpg',
  ];
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const navigationScreen(),
        appBar: AppBar(
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu_rounded,color: Colors.black,),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          automaticallyImplyLeading: true,
          title: Text(
            "Dashboard",
            style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  _BannerSwiper(),
                  const SizedBox(
                    height: 20,
                  ),
                  _HealthGrid(),
                  OffersView(),
                  DoctorsView(),
                  MedicineView(),
                ],
              ),
              _search(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 155, horizontal: 10),
      child: Container(
        height: 40,
        alignment: Alignment.center,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.all(const Radius.circular(10)),
          child: TextField(
            cursorColor: Theme.of(context).primaryColor,
            style: const TextStyle(color: Colors.black, fontSize: 12),
            decoration: const InputDecoration(
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

  Widget _BannerSwiper() {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 180,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/Rectangle 204.png"))));
            },
            pagination: SwiperPagination(),
            itemCount: imageList.length,
            itemWidth: double.infinity,
            itemHeight: 180.0,
            autoplayDelay: 5000,
            autoplay: true,
          ),
        ),
      ],
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
                              builder: (context) => HealthItemview()),
                        );
                      },
                      child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/health 2.png")),
                                  color: Colors.redAccent,
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

  Widget OffersView() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                height: size.height * 0.20,
                width: size.width * 1,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: new DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage(
                                    "assets/images/Rectangle 192.png"))));
                  },
                  pagination: SwiperPagination(),
                  itemCount: 6,
                  // itemWidth: 1000,
                  // itemHeight: 200.0,
                  autoplayDelay: 5000,
                  autoplay: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget DoctorsView() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Doctors".toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("View All".toUpperCase(),
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
                ),
              ],
            ),
            Container(
              height: 185,
              width: size.width,
              color: Colors.transparent,
              child: ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthItemview()),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                          "assets/images/Rectangle 158.png")),
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 15, right: 15),
                              child: Text("Doctor Name $index",style: TextStyle(fontSize: 13),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2, left: 15, right: 15),
                              child: Text(
                                "Heart Specialist".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Container(
                                height: 30,
                                width: 90,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  textColor: Colors.black,
                                  color: Colors.yellowAccent,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HealthItemview()),
                                    );
                                  },
                                  child: Text(
                                    'Book Now',
                                    style: TextStyle(fontSize: 11.7),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget MedicineView() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Medicine".toUpperCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("View All".toUpperCase(),
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey)),
                ),
              ],
            ),
            Container(
              height: 185,
              width: size.width,
              color: Colors.transparent,
              child: ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthItemview()),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 120.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage(
                                          "assets/images/Rectangle 210.png")),
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 15, right: 15),
                              child: Text("Medicine Name $index"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 15, right: 15),
                              child: Text(
                                "Lore Ipsum".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Container(
                                height: 30,
                                width: 90,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  textColor: Colors.black,
                                  color: Colors.yellowAccent,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HealthItemview()),
                                    );
                                  },
                                  child: Text(
                                    'Order Now',
                                    style: TextStyle(fontSize: 11.7),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
