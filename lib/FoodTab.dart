import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FoodTab extends StatefulWidget {
  const FoodTab({Key? key}) : super(key: key);

  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        _buildFood('Delicious hot dog', 4.0, '6', 'assets/hotdog.png'),
        SizedBox(
          height: 10.0,
        ),
        _buildFood('Delicious hot dog', 4.0, '6', 'assets/pizza.png'),
        SizedBox(
          height: 10.0,
        ),
        _buildFood('Delicious hot dog', 4.0, '6', 'assets/pizza.png'),
      ]),
    );
  }

  Widget _buildFood(String food,  rating, String price, String imgPath) {
    // return Container(
    //   height: 75.0,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(6.0),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey.withOpacity(0.8),
    //         blurRadius: 7.0
    //       )
    //     ]
    //   ),
    // );
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Color(0xFFFFE3DF),
              borderRadius: BorderRadius.circular(6.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 6.0
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(imgPath,height: 50,width: 50.0,),
            ),
          ),
        ),
        SizedBox(width: 10.0,),
        Column(
          children: [
            Text(food,style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),),
            SmoothStarRating(
              allowHalfRating: true,
              starCount: rating.toInt(),
              onRated: (v){},
              rating: rating,
              //size: 15.0,
              color: Colors.green,
              borderColor: Colors.black,
             
            ),
            Text('\$' + price,style: GoogleFonts.notoSans(color: Colors.pink),),
            Text('\$' + '18',style: GoogleFonts.lato(decoration: TextDecoration.lineThrough),)
          ],
         
        ),
        Padding(
          padding: const EdgeInsets.only(left:55.0),
          child: FloatingActionButton(
            onPressed: (){},
            heroTag: food,
            hoverColor: Colors.green,
            backgroundColor: Colors.green,
            child: Center(child: Icon(Icons.add),),
            ),
        )
      ],
    );
  }
}
