import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuko_app/custom_widght/number_widget.dart';
import 'package:tuko_app/moduls/Numbers.dart';

class NumbersScreen extends StatelessWidget
{
  static String id = 'MembersScreen';


  final List<Numbers> numbers = const [
    Numbers(image: 'assets/images/numbers/number_one.png', EnText: 'One', JpText: 'Ichi',Sound : 'number_eight_sound.mp3' ),
    Numbers(image: 'assets/images/numbers/number_two.png', EnText: 'Two', JpText:'Ni' ,Sound: 'number_five_sound.mp3'),
    Numbers(image: 'assets/images/numbers/number_three.png', EnText: 'Three', JpText:'San' ,Sound: 'number_four_sound.mp3'),
    Numbers(image: 'assets/images/numbers/number_four.png', EnText: 'Four', JpText: 'Shi',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/number_five.png', EnText: 'Five', JpText: 'Go',Sound :'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/number_six.png', EnText: 'Six', JpText: 'Roku',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/number_seven.png', EnText: 'Seven', JpText: 'Sebun',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/number_eight.png', EnText: 'Eight', JpText: 'hachi',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/number_nine.png', EnText: 'Nine', JpText: 'Kyu',Sound: 'number_nine_sound.mp3'),
    Numbers(image: 'assets/images/numbers/number_ten.png', EnText: 'Ten', JpText: 'Ju',Sound: 'number_nine_sound.mp3'),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Numbers'),),
      body: ListView.builder(
        itemBuilder: (context,  index) {
          return AllWidget(numbers : numbers[index],color: Colors.blueAccent,) ;

        },
        itemCount: numbers.length,

      )
    );
  }
  

}