import 'package:flutter/material.dart';

class ChatEntity {

  String message;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatEntity({required this.message,
     required this.id,
    required this.createdAt, required this.author, this.imageUrl});

  factory ChatEntity.fromJson(Map<String , dynamic> json)
  {
    return ChatEntity(message: json['message'], id: json['id'], createdAt: json['createdAt'], author: Author.fromJson(json) , imageUrl: json['imageUrl']);
  }
}

class Author {
  String username;
  Author({required this.username});

  //deserialization
  factory Author.fromJson(Map<String , dynamic> json)
  {
    return Author(username: json['author']['username']);
  }
}