import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../Services/ServiceDetailsList/ServiceDetailsList.dart';
import '../Services/ServicesView.dart';
import 'HealthCareDashboard.dart';



class ServiceDashboardView extends StatefulWidget {
  @override
  _ServiceDashboardViewState createState() => _ServiceDashboardViewState();
}

class _ServiceDashboardViewState extends State<ServiceDashboardView> {
  final imageList = [
    'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246__480.jpg',
    'https://cdn.pixabay.com/photo/2016/11/20/09/06/bowl-1842294__480.jpg',
    'https://cdn.pixabay.com/photo/2017/01/03/11/33/pizza-1949183__480.jpg',
    'https://cdn.pixabay.com/photo/2017/02/03/03/54/burger-2034433__480.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0 + MediaQuery.of(context).padding.top),
        child: SafeArea(
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: titleSection(),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _BannerSwiper(),
            _CategoryBackground(),
            ServiceGrid(),
            OffersView(),
            BestforyouView(),
            FeaturedserviceView(),
          ],
        ),
      ),
    );
  }

  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HealthCareDashboard()),
                    );
                  },child: Icon(Icons.arrow_back, color: Colors.black)),
                ),
                Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Services'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Nadakkav Kozhikode',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 10.7),
                            ),
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.black,
                              size: 10,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.search,
          ),
        ],
      ),
    );
  }

  Widget _BannerSwiper() {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:35),
          child: Container(
            height: size.height * 0.28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: Colors.amber),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: size.height * 0.30,
            width: size.width * 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.amber),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/cleaing8.jpg"))));
              },
              pagination: SwiperPagination(),
              itemCount: imageList.length,
              itemWidth: 1000,
              itemHeight: 200.0,
              autoplayDelay:5000,
              autoplay: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _CategoryBackground() {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 110,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15)),
              color: Colors.amber),
          child: ListView.separated(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: size.height * 0.28,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      flex: 0,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/Cleaning5.jpg",
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Data $index"),
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ],
    );
  }

  Widget ServiceGrid() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = 200;
    final double itemWidth = 200;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Services".toUpperCase(),
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.transparent,
              height: size.height /2.1,
              width: size.width * 1.8,
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
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
                              builder: (context) => ServiceView()),
                        );
                      },
                      child: Container(
                          color: Colors.transparent,
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/Cleaning3.jpg")),
                              color: Colors.redAccent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Cleaning  $index",style: TextStyle(fontSize: 12.5),),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Offers".toUpperCase(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                ),
                SizedBox(width: 20,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                height: size.height * 0.20,
                width: size.width * 1,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/Cleaning2.jpg"))));
                  },
                  pagination: SwiperPagination(),
                  itemCount: imageList.length,
                  itemWidth: 1000,
                  itemHeight: 200.0,
                  autoplayDelay:5000,
                  autoplay: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BestforyouView() {
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
                  child: Text("Best For You".toUpperCase(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 20,
                    width: 65,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blueGrey)),
                      onPressed: () {},
                      color: Colors.blueGrey[300],
                      textColor: Colors.black,
                      child: Text("View All".toUpperCase(),
                          style: TextStyle(fontSize: 7)),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 180,
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
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceDetailsList()),
                        );
                      },
                      child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 150.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/images/Cleaning6.jpg")),
                                    color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:5,left: 15,right: 15),
                                child: Text("Cleaning $index"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:5,left: 15,right: 15),
                                child: Text("${index}0 % Offer".toUpperCase(),style: TextStyle(fontSize: 12,color: Colors.black87),),
                              )
                            ],
                          )),
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

  Widget FeaturedserviceView() {
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Featured Services".toUpperCase(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 20,
                    width: 65,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blueGrey)),
                      onPressed: () {},
                      color: Colors.blueGrey[300],
                      textColor: Colors.black,
                      child: Text("View All".toUpperCase(),
                          style: TextStyle(fontSize: 7)),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 180,
              width: size.width,
              child: ListView.separated(
                itemCount: 15,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 150.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/images/Cleaning7.jpg")),

                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5,left: 15,right: 15),
                              child: Text("Cleaning $index"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5,left: 15,right: 15),
                              child: Text("${index}0 % Offer".toUpperCase(),style: TextStyle(fontSize: 12,color: Colors.black87),),
                            )
                          ],
                        )),
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
