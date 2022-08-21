import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../custom_widght/number_widget.dart';
import '../moduls/Numbers.dart';

class FamilyScreen extends StatelessWidget
{
  final List<Numbers> numbers = const [
    Numbers(image: 'assets/images/family_members/family_father.png', EnText: 'father', JpText:  'Chichioya',Sound : 'father.wav' ),
    Numbers(image: 'assets/images/family_members/family_daughter.png', EnText:  'daughter', JpText:'Musume' ,Sound: 'daughter.wav'),
    Numbers(image: 'assets/images/numbers/family_daughter.png', EnText: 'Three', JpText:'Ojīsan' ,Sound:  'grand father.wav'),
    Numbers(image: 'assets/images/numbers/family_daughter.png', EnText: 'Four', JpText: 'Shi',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/family_daughter.png', EnText: 'Five', JpText: 'Go',Sound :'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/family_daughter.png', EnText: 'Six', JpText: 'Roku',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/family_daughter.png', EnText: 'Seven', JpText: 'Sebun',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/family_daughter.png', EnText: 'Eight', JpText: 'hachi',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/family_daughter.png', EnText: 'Nine', JpText: 'Kyu',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/family_daughter.png', EnText: 'Ten', JpText: 'Ju',Sound: 'number_nine_sound.mp3'),

  ];

  static String id = 'FamilyScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('Family members'),),
        body: ListView.builder(
          itemBuilder: (context,  index) {
            return AllWidget(numbers : numbers[index], color:  Colors.indigoAccent,) ;

          },
          itemCount: numbers.length,

        )
    );
  }

}