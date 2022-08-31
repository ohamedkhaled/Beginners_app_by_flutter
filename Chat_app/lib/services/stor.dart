
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Moduls/Masseges.dart';
import '../constants.dart';

class Stor {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMessage(Message massege ){
    CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollections);
    return messages.add({kMessage:massege.content,kCreatedAt:massege.time,'id':massege.Id}).then((value) => print('added')).catchError((error) => print("Failed to add user: $error"));
  }



}