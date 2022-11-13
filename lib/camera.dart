import 'dart:io';
//import 'package:artblock/search_view.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:smol_biz/home-screen.dart';
//import 'package:palette_generator/palette_generator.dart';

/* add image_picker to dependencies under yaml */

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  String searchQuery;
  File imageFile;
  final ImagePicker _picker = ImagePicker();
  final HomeScreen home = new HomeScreen();
  // upload from gallery method
  _openGallery(BuildContext context) async {
    var Xpicture = await _picker.pickImage(source: ImageSource.gallery);
    var picture = File(Xpicture.path);
    this.setState(() {
      imageFile = picture;
    });
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    var fileName = basename(picture.path);
    debugPrint(fileName);
    File localImage = await picture.copy('$appDocPath/$fileName');
    this.setState(() {
      imageFile = localImage;
    });

    Navigator.of(context).pop();
  }

  // take a picture method
  Future<void> _openCamera(BuildContext context) async {
    var Xpicture = await _picker.pickImage(source: ImageSource.camera);
    var picture = File(Xpicture.path);
    this.setState(() {
      imageFile = picture;
    });
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    var fileName = basename(picture.path);
    debugPrint(fileName);
    File localImage = await picture.copy('$appDocPath/$fileName');
    this.setState(() {
      imageFile = localImage;
    });

    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose An Option"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  // shows selected image or tells the user that no image is selected
  Widget _deicdeImageView() {
    if (imageFile == null) {
      return new Text('No Image Selected',
          style: TextStyle(
            //inbuilt named colors
            color: Colors.white,
          ));
    } else {
      return Image.file(imageFile, width: 400, height: 400);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 2.0,
        backgroundColor: Colors.indigo,
        title: const Text('Community Connect',
            style: TextStyle(
              //fontFamily: 'Open Sans',
              color: Colors.white,
              fontWeight: FontWeight.w500,
            )
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(gardenFlag: true)))
              })
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _deicdeImageView(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber[900]),
                  onPressed: () {
                    _showChoiceDialog(context);
                  },
                  child: new Text(
                    'SELECT',
                    style: TextStyle(
                      //inbuilt named colors
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}