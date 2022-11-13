import 'package:flutter/material.dart';

class BizCard extends StatelessWidget {
  //const BizCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:70.0,bottom:32.0,left:32.0,right:32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 320),
                      Text(
                        "Fukuro",
                        style: TextStyle(
                          fontSize: 56,
                          color: Color.fromARGB(255, 43, 39, 39),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'FOOD AND DRINK',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 43, 39, 39),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        '3000 Northside Blvd Suite 600',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 43, 39, 39),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Divider(color: Colors.black38),
                      SizedBox(height: 15),
                      Text(
                        "A family-owned poke, sushi, and tea store close to UTD!",
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 43, 39, 39),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(color: Colors.black38),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, -0.7),
                  child: Container(
                    height: 300,
                    width: 350,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/fukuro.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill),
                    ),
                  ),
                )

              ],),
      );
  }


}