import 'package:flutter/material.dart';
import 'package:smol_biz/camera.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class HomeScreen extends StatelessWidget {
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

  List<bool> favorited = <bool>[false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmolBiz'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container( //apply margin and padding using Container Widget.
            padding: EdgeInsets.only(top:20,left:20,right:20,bottom:5), //You can use EdgeInsets like above
            margin: EdgeInsets.all(5),
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  )
              ),
              suggestionsCallback: (pattern) async {
                //return await BackendService.getSuggestions(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(suggestion['name']),
                  subtitle: Text('\$${suggestion['price']}'),
                );
              },
              /*onSuggestionSelected: (suggestion) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductPage(product: suggestion)
                ));
              },*/
          )),
          Container(
            margin: EdgeInsets.only(left: 25, right: 30),
            child:SizedBox(
              height: 50,
              child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: tagNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(colorTags[index]),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(tagNames[index]),
                              )
                            ]
                          ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10);
                    },
                ))),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: businessNames.length,
              itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Card(
                  elevation: 5,
                  color: Colors.brown[colorCodes[index]],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/${businessImageFilenames[index]}.jpg',
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
                                '${businessNames[index]}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(' • '),
                              Text('${businessPrices[index]}'),
                            ]
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.location_on),
                            Text(
                              '${businessDistances[index]}',
                              style: TextStyle(color: Colors.blue[700]),
                            ),
                          ]
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text('${businessDescriptions[index]}'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children:
                                tagMaps[index].asMap().entries.map((entry) {
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
                                icon: favorited[index] ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                                onPressed: () {
                                  () =>
                                    favorited[index] = !favorited[index];
                                },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
          )),
        ],
      )
    );
  }
}