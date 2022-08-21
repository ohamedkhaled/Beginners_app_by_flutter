import 'package:flutter/material.dart';
import 'package:tuko_app/moduls/Numbers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AllWidget extends StatelessWidget
{
late Numbers numbers  ;
final Color color ;



  AllWidget({ required this.color ,required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.blueAccent,
      child: Row(
        children: <Widget>[
          Container(
              color: Colors.indigo,
              height: 60,
              width: 60,
              child: Image(image: AssetImage(numbers.image))
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(numbers.JpText,style: TextStyle(color: Colors.white,fontSize: 16),),
                Text(numbers.EnText,style: TextStyle(color: Colors.white,fontSize: 16 ),)
              ],  ),
          ),
          Spacer(flex: 1),




          IconButton(onPressed: ()  {
            AssetsAudioPlayer.newPlayer().open(
              Audio("assets/sounds/numbers/${numbers.Sound}"),
              autoStart: true
            );
          }, icon: Icon(Icons.play_arrow ,color: Colors.white,) )

        ],
      ) ,
    );
  }

}