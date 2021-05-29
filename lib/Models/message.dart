import 'package:flutter/material.dart';

class MessageApp {
  final String messageId;
  final String userId;
  final String date;
  final String message;

  MessageApp({this.date, this.message, @required this.messageId, @required this.userId});

  factory MessageApp.fromJson(Map<String, dynamic> json){
    return MessageApp(  
      date: json['date'],
      message: json['message'],
      messageId: json['messageId'],
      userId: json['userId']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'date': date,
      'message':message,
      'userId':userId,
      'messageId':messageId
    };
  }
}