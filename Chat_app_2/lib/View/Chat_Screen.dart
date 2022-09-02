import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import '../constants.dart';
import '../Moduls/Masseges.dart';
import '../services/stor.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'ChatScreen';
  final _controller = ScrollController();
  final Stream<QuerySnapshot> _massagesStream = FirebaseFirestore.instance
      .collection(kMessagesCollections)
      .orderBy(kCreatedAt, descending: true)
      .snapshots();
  TextEditingController controller = TextEditingController();
  Message message = Message();
  Stor stor = Stor();

  @override
  Widget build(BuildContext context) {
    String? Email =ModalRoute.of(context)!.settings.arguments as String?;
    return StreamBuilder<QuerySnapshot>(
        stream: _massagesStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromjason(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: kPrimaryColor,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 120),
                      child: Row(
                        children: [
                          Image.asset(kLogo),
                          Text(
                            'Chat',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                body: Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemBuilder: (BuildContext context, int index) {
                          if(Email ==messagesList[index].Id){
                            print(messagesList[index].time?.toDate());
                            return Bubble(
                              elevation: 5,
                              shadowColor: kPrimaryColor,
                              alignment: Alignment.topRight,
                              stick: false,
                              margin: BubbleEdges.only(top: 10),
                              nip: BubbleNip.rightBottom,
                              color: kPrimaryColor,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    messagesList[index].content!,
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                 messagesList[index].time!.toDate().minute.toInt() < 10 ? 
                                 Text( '${messagesList[index].time?.toDate().hour}:0${messagesList[index].time!.toDate().minute}',
                                     style: TextStyle( color: Colors.white,fontSize: 10),)
                                     :
                                     Text('${messagesList[index].time?.toDate().hour}:${messagesList[index].time!.toDate().minute}',
                                         style: TextStyle( color: Colors.white,fontSize: 10))
                                     
                                ],
                              ),
                            );
                          } else
                            {
                              return Bubble(
                                elevation:5 ,
                                shadowColor: kPrimaryColor,
                                margin: BubbleEdges.only(top: 10),
                                alignment: Alignment.topLeft,
                                nip: BubbleNip.leftBottom,
                                child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(messagesList[index].content!,style: TextStyle(color: kPrimaryColor,fontSize: 16)),
                              messagesList[index].time!.toDate().minute.toInt() < 10 ?
                              Text( '${messagesList[index].time?.toDate().hour}:0${messagesList[index].time!.toDate().minute}',
                                  style: TextStyle( color:kPrimaryColor,fontSize: 10)
                              )
                                  :
                              Text('${messagesList[index].time?.toDate().hour}:${messagesList[index].time!.toDate().minute}',
                                  style: TextStyle( color:kPrimaryColor,fontSize: 10)
                              )
                            ],
                          ),
                              );
                            }

                        },
                        itemCount: messagesList.length,

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller,
                        onSubmitted:(value){
                          OnClick( Email!);
                        },
                        decoration: InputDecoration(
                            hintText: 'send Message',
                            contentPadding: EdgeInsets.all(10),
                            suffixIcon: IconButton(
                              onPressed: () {
                                OnClick( Email!);
                              },
                              icon: Icon(Icons.send_rounded),
                              color: kPrimaryColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(16)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(16))),
                      ),
                    ),
                  ],
                ));
          } else {
            return Scaffold(
                body: Center(
              child: Text('Loading...!'),
            ));
          }
        });
  }

  OnClick(String id){
    message.content = controller.text;
    message.time =Timestamp.now();
    message.Id=id ;
    stor.addMessage(message);
    controller.clear();
    _controller.animateTo(
        _controller.position.minScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.bounceInOut);
  }
}
