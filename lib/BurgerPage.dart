import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class burgerPage extends StatefulWidget {
  final String herotag;
  final String imgPath;
  final String Dishname;
  final String num;
  const burgerPage(
      {Key? key,
      required this.Dishname,
      required this.herotag,
      required this.imgPath,
      required this.num})
      : super(key: key);

  @override
  _burgerPageState createState() => _burgerPageState();
}

class _burgerPageState extends State<burgerPage> {
  var quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.menu)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.pink.withOpacity(0.3),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 4.0,
                          offset: Offset(0.0, 4.0),
                          color: Colors.white,
                          blurRadius: 6.0)
                    ]),
                child: Center(
                  child: Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text('SUPER',
              style: GoogleFonts.notoSans(
                  fontSize: 25.0, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5.0),
          child: Text(widget.Dishname.toUpperCase(),
              style: GoogleFonts.notoSans(
                  fontSize: 25.0, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6.0)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Hero(tag: 'dish-${widget.imgPath}',  child: Image.asset(widget.imgPath)),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' + widget.num.toUpperCase(),
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
              SizedBox(
                width: 30.0,
              ),
              Container(
                height: 60.0,
                width: 225,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                        bottomLeft: Radius.circular(6.0))),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  blurRadius: 6.0,
                                  spreadRadius: 4.0)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  removeItems("MINUS");
                                },
                                icon: Icon(Icons.remove)),
                            VerticalDivider(
                              thickness: 3.0,
                            ),
                            Text(
                              quantity.toString(),
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            VerticalDivider(
                              thickness: 3.0,
                            ),
                            IconButton(
                                onPressed: () {
                                  removeItems("PLUS");
                                },
                                icon: Icon(Icons.add)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  void removeItems(String s) {
    switch (s) {
      case "MINUS":
        setState(() {
          if (quantity > 0) {
            quantity = quantity - 1;
          }
        });
        break;
      case "PLUS":
        setState(() {
          quantity = quantity + 1;
        });
        break;
      default:
        quantity = 0;
    }
  }
}
