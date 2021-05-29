
import 'package:flutter/material.dart';
import 'package:flutter_fb_store/Models/message.dart';
import 'package:flutter_fb_store/services/firestoreService.dart';

class DetailMessage extends StatelessWidget {
  
  DetailMessage({Key key,  @required this.messageApp}) : super(key: key);
  
  final MessageApp messageApp;
  
  TextEditingController _messageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: messageApp.message,
              ),
              
            ),
            
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: MaterialButton(
              onPressed: () async {
                await FirestoreService().updateMessageApp(
                  MessageApp(
                    messageId: "BBru0x20jw7HBdIO7N5X", 
                    userId: "userID1", 
                    date: DateTime.now().toUtc().toString(), 
                    message: _messageController.text)
                  );
                Navigator.of(context).pop();
              },
              child: Text("Sqve"),
            ),
          ),
        ],
      ),
    );
  }


}


