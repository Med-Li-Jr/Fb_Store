
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fb_store/Models/message.dart';

class FirestoreService {
FirebaseFirestore _db = FirebaseFirestore.instance; 

    //Get MessagesApp
    Stream<QuerySnapshot> getMessagesApp(){
      return _db
        .collection('MessagesApp')
        .snapshots();
    }

    //Insert
    Future<void> setMessageApp(MessageApp message){
      return _db
        .collection('MessagesApp')
        .add(message.toMap());
        // .doc(message.messageId)
        // .set(message.toMap());
    }

    //Update
    Future<void> updateMessageApp(MessageApp message){
      return _db
        .collection('MessagesApp')
        .doc(message.messageId)
        .update(message.toMap());
    }


    //Delete
    Future<void> removeMessageApp(String messageAppId){
      return _db
        .collection('MessagesApp')
        .doc(messageAppId)
        .delete();
    }

}