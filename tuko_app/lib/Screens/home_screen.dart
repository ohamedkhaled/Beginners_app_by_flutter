import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuko_app/Screens/nembers_screen.dart';
import 'package:tuko_app/Screens/famly_screen.dart';
import 'package:tuko_app/Screens/phrases_screen.dart';

import '../custom_widght/categorywidght.dart';
import 'color_screen.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toku'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          CategoryWidget(
            color: Colors.blue,
            Name: 'Nembers',
            OnTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NumbersScreen();
              }));
            },
          ),
          SizedBox(
            height: 5,
          ),
          CategoryWidget(
            color: Colors.blueAccent,
            Name: 'Family Members',
            OnTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FamilyScreen()));
            },
          ),
          SizedBox(
            height: 5,
          ),
          CategoryWidget(
              color: Colors.indigoAccent,
              Name: 'Colors',
              OnTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ColorsScreen()));
              }),
          SizedBox(
            height: 5,
          ),
          CategoryWidget(
              color: Colors.indigo,
              Name: 'Phrases',
              OnTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhrasesScreen()));
              }),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: <Widget>[
                Container(
                    child: Image(image: AssetImage('assets/Icons/icon2.png'))),
                Text(
                  'Tuko learning',
                  style: TextStyle(
                      fontFamily: 'Pacifico', fontStyle: FontStyle.italic),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
