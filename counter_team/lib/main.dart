import 'package:flutter/material.dart';

void main() {
  runApp(CounterTeam());
}

class CounterTeam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterTeam();
  }
}

class _CounterTeam extends State<CounterTeam> {
  int counterA =0;
  int counterB=0;
  @override
  Widget build(BuildContext context) {
    ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      primary: Colors.orange,
      minimumSize: Size(40, 40),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Points Counter'),
          backgroundColor: Colors.orange,
        ),
        body:
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                             Text(
                              'Team A',
                              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                            ),

                          Text(
                            '$counterA',
                            style: TextStyle(fontSize: 120, fontWeight: FontWeight.w300),
                          ),
                          ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              setState(() {
                                increasCounterA1();
                              });
                            },
                            child: Text('Add 1 Point'),
                          ),
                          ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              setState(() {
                                increasCounterA2();
                              });
                            },
                            child: Text('Add 2 Point'),
                          ),
                          ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              setState(() {
                                increasCounterA3();
                              });
                            },
                            child: Text('Add 3 Point'),
                          ),
                        ],
                      ),
                      Container(
                        height: 500,
                        child: VerticalDivider(
                          width: 20,
                          color: Colors.grey,
                          thickness: 1,
                          indent: 50,
                          endIndent: 30,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Team B',
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '$counterB',
                            style: TextStyle(fontSize: 120, fontWeight: FontWeight.w300),
                          ),
                          ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              setState(() {
                                increasCounterB1();
                              });
                            },
                            child: Text('Add 1 Point'),
                          ),
                          ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              setState(() {
                                increasCounterB2();
                              });
                            },
                            child: Text('Add 2 Point'),
                          ),
                          ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () {
                              setState(() {
                                increasCounterB3();
                              });
                            },
                            child: Text('Add 3 Point'),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    setState(() {
                      counterB=0;
                      counterA=0;
                    });
                  },
                  child: Text('Reset',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                ),
              ],
            ),




        ),

    );
  }

  increasCounterA1(){
    counterA++;
  }
  increasCounterA2(){
    counterA=counterA+2;
  }
  increasCounterA3(){
    counterA=counterA+3;
  }
  increasCounterB1(){
    counterB++;
  }
  increasCounterB2(){
    counterB=counterB+2;
  }
  increasCounterB3(){
    counterB=counterB+3;
  }

}
