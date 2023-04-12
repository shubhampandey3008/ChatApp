import 'dart:convert';

import 'package:chat_app/models/Image_model.dart';
import 'package:chat_app/repo/image_repo.dart';
import 'package:chat_app/service/appAuth.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/ChatEntity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  // ChatEntity newMessage;
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatEntity> _message = [];

  _loadMessages() async {
    print("Inside the loadmessage function");
    final response = await rootBundle.loadString('assets/mock_messages.json');
    List<dynamic> decodeResponse = jsonDecode(response) as List;
    print(decodeResponse.length);
    print("reached here");
    List<ChatEntity> _chatMessages = decodeResponse.map((entity) {
      return ChatEntity.fromJson(entity);
    }).toList();


    setState(() {
      _message = _chatMessages;
      print(_message[0].createdAt);
    });
    print(response);
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadMessages();
    super.initState();
  }

  void addNewMessage(ChatEntity entity) {
    _message.add(entity);
    print("mic testing 1 2 3  ${entity.imageUrl} ");
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final username = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/chatImage.jpg',
                  ),
                  fit: BoxFit.cover
              ),
            ),
          )
          , Column(
            children: [
              Expanded(
                //TODO: Create a dynamic sized list
                  child: ListView.builder(
                      itemCount: _message.length,
                      itemBuilder: (context, index) {
                        return ChatBubble(
                            alignment: _message[index].author.username
                                .toString() ==
                                context.read<AuthServices>().returnUsername()
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            entity: _message[index],
                            colorPassed: _message[index].author.username
                                .toString() ==
                                context.read<AuthServices>().returnUsername()
                                ? Colors.white
                                : Colors.lightGreen);
                      })),
              ChatInput(
                  onSubmit: addNewMessage
              ),
            ],
          )
        ],
      ),
    );
  }
}
