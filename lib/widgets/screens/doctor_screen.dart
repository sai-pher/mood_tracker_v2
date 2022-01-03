import 'package:flutter/material.dart';
import 'package:mood_tracker_v2/db_handler/models/chat_message_model.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _doctorScreen();
  }

  _doctorScreen() {

    List<ChatMessage> messages = [
      ChatMessage(messageContent: "Hello, sena", messageType: "receiver"),
      ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
      ChatMessage(messageContent: "Hey Dr Dzifa, I am doing ok", messageType: "sender"),
      ChatMessage(messageContent: "great! why don't you tell me how your week has been.", messageType: "receiver"),
      ChatMessage(messageContent: "It's been alright so far.", messageType: "sender"),
      ChatMessage(messageContent: "I had a presentation earlier and was feeling anxious about it", messageType: "sender"),
      ChatMessage(messageContent: "but i used the breathing exercises you recommended and that really helped me", messageType: "sender"),
      ChatMessage(messageContent: "Oh good! glad to hear it.", messageType: "receiver"),
    ];

    return Stack(
      children: <Widget>[
        ListView.builder(
          itemCount: messages.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return Container(
              padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
              child: Align(
                alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (messages[index].messageType  == "receiver"?Colors.green[400]:Colors.blue[400]),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Text(messages[index].messageContent, style: const TextStyle(fontSize: 15),),
                ),
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.add, size: 20, ),
                  ),
                ),
                const SizedBox(width: 15,),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                FloatingActionButton(
                  onPressed: (){},
                  child: const Icon(Icons.send,color: Colors.white,size: 18,),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                ),
              ],

            ),
          ),
        ),
      ],
    );
  }
}
