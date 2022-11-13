import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  //const HomeScreen({super.key});
  final List<String> businessImageFilenames = <String>['fukuro', 'pizzeria', 'salon', 'autoshop'];
  final List<String> businessNames = <String>['Fukuro', 'Ferraria\'s Pizzeria', 'Salon K', 'Plano Auto Shop'];
  final List<String> businessPrices = <String>["\$\$", "\$\$", "\$\$\$", "\$\$"];
  final List<String> businessDistances = <String>['2 miles away','4.6 miles away','2.8 miles away','6.7 miles away'];
  final List<String> businessDescriptions = <String>['Mostly serving Japanese food, Fukuro is the rare but definitely welcomed combination of a restaurant that serves food and boba.', 'Family-owned joint in a shopping mall with thin-crust pizza, entrees & sandwiches, plus beer & wine.', 'Haircuts for all ages brought to you by trained professionals. We offer services for all types of hair and welcome diversity.', 'One-stop shop for all of your plumbing needs. We offer top quality plumbing materials and expert opinions.'];
  final List<int> colorCodes = <int>[50, 50, 50, 50];

  final List<int> colorTags = <int>[0xFFFFCAFF,0xFFC8DBFF,0xFFEBF3D0,0xFFFFB8B8,0xFFCDF9E8,0xFFC2A6F1,0xFFFFFDB1,0xFF9CBBF6,0xFF9CBBF6];
  final List<String> tagNames = <String>['BEAUTY','TECH','FOOD','AUTO','ESPAÑOL','WOMEN OWNED','BLACK OWNED','FAMILY OWNED','DRINK'];

  final List<List<int>> tagMaps = <List<int>>[[2,8],[2,8],[0,5],[3]];

  List<bool> favorited = <bool>[false, false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Community Connect',
          style: TextStyle(
            //fontFamily: 'Open Sans',
            color: Colors.white,
            fontWeight: FontWeight.w500,
          )
        ),
      ),


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
                    padding: EdgeInsets.only(right:40, top: 10, left: 4),
                    child: Text(
                      "JAKE STONE",
                      style: TextStyle(
                          fontFamily: 'Open Sans',
                          fontSize: 40.0,
                          color: Colors.indigo,
                          fontWeight: FontWeight.w900,
                          //decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center,
                    ),


                  ),


                  const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage:(AssetImage('assets/images/profile1.jpg')),
                      )),

                  //extra container for padding
                  Container(
                    margin: const EdgeInsets.only(left: 20,top: 8),
                  ),


                ],
              ),


              Row(
                children: const <Widget> [
                  Padding(
                    padding: EdgeInsets.only(right:10, top: 2, left: 30),
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
                    padding: EdgeInsets.only(left:30, top: 10),
                    child: Image.asset('assets/images/card1.jpg',
                        scale: 2),
                  ),

                ],
              ),


              Row(
                children: const <Widget> [
                  Padding(
                    padding: EdgeInsets.only(right:10, top: 20, bottom: 5, left: 30),
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

          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Card(

              elevation: 5,
              color: Colors.brown[colorCodes[2]],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 2.0, bottom: 2, left: 12, right: 12),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                          'assets/images/${businessImageFilenames[2]}.jpg',
                          width: 380,
                          height: 120,
                          fit: BoxFit.fill
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${businessNames[2]}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(' • '),
                            Text('${businessPrices[2]}'),
                          ]
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.location_on),
                          Text(
                            '${businessDistances[2]}',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                        ]
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text('${businessDescriptions[2]}'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                            children:
                            tagMaps[2].asMap().entries.map((entry) {
                              var w = Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(right:5),
                                color: Color(colorTags[entry.value]),
                                height: 30,
                                child: Text(tagNames[entry.value]),
                              );
                              return w;
                            }).toList()
                        ),
                        IconButton(
                          icon: favorited[2] ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                          onPressed: () {
                                () =>
                            favorited[2] = !favorited[2];
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),









            ], //children***





          ),

        ),



      ),
    );
  }
}