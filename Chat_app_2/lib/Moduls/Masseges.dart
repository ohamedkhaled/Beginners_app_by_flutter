
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';

class Message {

  String? content ;
  Timestamp? time ;
  String? Id;
  Message({ this.content,this.time , this.Id});

  factory Message.fromjason( dynamic jasonData ){
    return Message( content: jasonData[kMessage] ,time: jasonData[kCreatedAt],Id: jasonData['id']) ;
  }
}