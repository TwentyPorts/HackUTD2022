import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Center(


          child: Column(
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,


                children: <Widget> [

                  const Padding(
                    padding: EdgeInsets.only(right:40, top: 30, left: 4),
                    child: Text(
                      "JAKE STONE",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline

                      ),
                      textAlign: TextAlign.center,
                    ),


                  ),


                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: CircleAvatar(
                    radius: 35,
                    backgroundImage:(AssetImage('assets/images/profile.jpg')),
                  )),

                  //extra container for padding
                  Container(
                    margin: const EdgeInsets.only(left: 20,top: 20),
                  ),


                ],
              ),


              Row(
                children: const <Widget> [
                  Padding(
                    padding: EdgeInsets.only(right:10, top: 30, left: 30),
                    child: Text(
                      "MY WALLET",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),


              Row(
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.only(left:30, top: 12),
                    child: Image.asset('assets/images/card1.jpg',
                    scale: 2),
                  ),

                ],
              ),


              Row(
                children: const <Widget> [
                  Padding(
                    padding: EdgeInsets.only(right:10, top: 25, left: 30),
                    child: Text(
                      "MY FAVORITES",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),








            ], //children***





          ),

        ),



      ),


    );
  }
}
