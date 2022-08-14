import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BusinssCard());
}

class BusinssCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF2B475E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 100,
                child: CircleAvatar(
                  radius: 99,
                  backgroundImage: AssetImage('images/tharwat.png'),
                ),
              ),


            Text('Mohamed Khaled',
                style: TextStyle(
                    fontSize: 22, fontFamily: 'Pacifico', color: Colors.white)),
            Text('Flutter Developer'.toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
             Divider(
               color: Colors.grey,
               indent: 50 ,
               endIndent: 50 ,
               thickness: 2,
             ),
            Card(
              color: Colors.white,
              shape:RoundedRectangleBorder( borderRadius: BorderRadius.circular(10))  ,
              margin:EdgeInsets.all(10) ,
              child: ListTile(
                leading:Icon(Icons.phone , color: Color(0xFF2B475E),) ,
                title:Text('01067404847',style: TextStyle(color: Color(0xFF2B475E),)),
                trailing: Icon(Icons.perm_identity , color: Color(0xFF2B475E),),

              ),
            ),

             // Padding(
             //    padding: const EdgeInsets.all(8.0),
             //    child: Container(
             //      decoration: BoxDecoration(
             //        color: Colors.white,
             //        borderRadius: BorderRadius.circular(16)
             //
             //      ),
             //      height: 55,
             //      child:Row(
             //              children: <Widget>[
             //
             //                Padding(
             //                  padding: const EdgeInsets.only(left:10),
             //                  child: Icon(Icons.phone , color: Color(0xFF2B475E),),
             //                ),
             //
             //                Padding(
             //                  padding: const EdgeInsets.only(left: 25),
             //                  child: Text('01067404847',style: TextStyle(color: Color(0xFF2B475E),fontSize: 18), ),
             //                ),
             //
             //          ]),
             //
             //
             //    ),
             //  ),
             SizedBox(height: 10, ),
            //  Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(16)
            //
            //     ),
            //     height: 55,
            //     child:Row(
            //         children: <Widget>[
            //
            //
            //           Padding(
            //             padding: const EdgeInsets.only(left: 10),
            //             child: Icon(Icons.email , color: Color(0xFF2B475E),),
            //           ),
            //
            //           Padding(
            //             padding: const EdgeInsets.only(left: 25),
            //             child: Text('mokhaled401@gmail.com',style: TextStyle(color: Color(0xFF2B475E),fontSize: 18), ),
            //           ),
            //
            //         ]),
            //
            //
            //   ),
            // ),
            Card(
              color: Colors.white,
              shape:RoundedRectangleBorder( borderRadius: BorderRadius.circular(10))  ,
              margin:EdgeInsets.all(10) ,
              child: ListTile(
                leading:Icon(Icons.email , color: Color(0xFF2B475E),) ,
                title:Text('mokhaled401@gmail.com',style: TextStyle(color: Color(0xFF2B475E),)),
                trailing: Icon(Icons.perm_identity , color: Color(0xFF2B475E),),

              ),
            ),


          ],
        ),
      ),
    );
  }
}
