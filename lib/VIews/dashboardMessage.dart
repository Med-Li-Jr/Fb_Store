
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fb_store/Models/message.dart';
import 'package:flutter_fb_store/VIews/AddMessage.dart';
import 'package:flutter_fb_store/services/firestoreService.dart';
import 'package:flutter_fb_store/VIews/DetailMessage.dart';

class DashboardMessages extends StatefulWidget {
  @override
  _DashboardMessagesState createState() => _DashboardMessagesState();
}

class _DashboardMessagesState extends State<DashboardMessages> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddView(),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ItemList(),
        ),
      ),
    );
  }
}




class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreService().getMessagesApp(),

      builder: (context, snapshot) {

      try{
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(

              separatorBuilder: (context, index) => SizedBox(height: 16.0),
              itemCount: snapshot.data.docs.length,

              itemBuilder: (context, index) {

                var messageData = snapshot.data.docs[index];

                String messageId = snapshot.data.docs[index].id;
                String message = messageData['message'];
                String date = messageData['date'];
                String userId = messageData['userId'];

                return Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    title: Text(
                      "message Id : " + messageId,
                    ),
                    subtitle: Text(
                      " message : " + message + " \n Date : " + date + " \n user Id = " + userId,
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMessage(messageApp: MessageApp(message: message, messageId: messageId, userId: userId, date: date),),
                        ),
                      );
                    },
                    onLongPress: (){
                      FirestoreService().removeMessageApp(messageId);
                    },
                  ),
                );
              },
            );
          }
      }
      catch(e){
        return Text('Something went wrong');
      }
      return Center(
          child: CircularProgressIndicator(
          ),
        );
      },
    );
  }
}




