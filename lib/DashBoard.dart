import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_reservation/BurgerPage.dart';
import 'package:online_reservation/FoodTab.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: Offset(3.0, 4.0))
                    ],
                    //color: Colors.black,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/tuxedo.png'),
                        fit: BoxFit.contain),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 0.2,
                      offset: Offset(2.0, 0.0),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'search',
                      hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                      fillColor: Colors.grey.withOpacity(0.5),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Recommended",
                style: GoogleFonts.notoSans(fontSize: 24.0)),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
                //color: Colors.black
                ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildListItems("hamburger", "assets/burger.png", 21,
                      Color(0xFFFFE9C6), Color(0xFFDA9551)),
                  SizedBox(width: 10.0),
                  _buildListItems("chips", "assets/fries.png", 21,
                      Color(0xFFC2E3FE), Color(0xFF6A8CAA)),
                  SizedBox(width: 10.0),
                  _buildListItems("Donuts", "assets/doughnut.png", 21,
                      Color(0xFFD7FADA), Color(0xFF56CC7E)),
                ],
              ),
            ),
          ),
          SizedBox(height:20.0),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: TabBar(
             controller: _tabController,
             isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.green,
            unselectedLabelStyle: GoogleFonts.notoSans(fontSize: 16.0,fontWeight: FontWeight.w400),
            unselectedLabelColor: Colors.grey.withOpacity(0.6),
            labelStyle: GoogleFonts.notoSans(fontSize: 20.0,fontWeight: FontWeight.w700),
             tabs: [
              Tab(
                child: Text('featured',
                style: GoogleFonts.notoSans(fontSize: 16.0
                ),)),
                Tab(
                child: Text('combo',
                style: GoogleFonts.notoSans(fontSize: 16.0
                ),)),
                Tab(
                child: Text('favourites',
                style: GoogleFonts.notoSans(fontSize: 16.0
                ),)),
                Tab(
                child: Text('recommended',
                style: GoogleFonts.notoSans(fontSize: 16.0
                ),)),
                 
               
             ]),
         ),
        //  SizedBox(
        //    height: 10.0,
        //  ),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
             height: MediaQuery.of(context).size.height - 150,
             decoration: BoxDecoration(
               color: Colors.black
             ),
             child: TabBarView(
                controller: _tabController,
               children: [
              FoodTab(),
              FoodTab(),
              FoodTab(),
              FoodTab(),
             ]),
           ),
         )
        ],
      ),
    );
  }

  Widget _buildListItems(
      String dish, String imgpath, int num, Color bgColor, Color textColor) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => burgerPage(Dishname: dish,herotag: 'dish-${imgpath}',imgPath: imgpath,num: num.toString())));
      },
      child: Container(
        height: 200.0,
        width: 200.0,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(6.0)),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(tag: 'dish-${imgpath}',child: Image.asset(imgpath) ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                dish,
                style: GoogleFonts.notoSans(fontSize: 20.0),
              ),
              Text(
                '\$' + num.toString(),
                style: GoogleFonts.notoSans(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
