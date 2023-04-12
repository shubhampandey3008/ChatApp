import 'package:chat_app/chat_page.dart';
import 'package:chat_app/models/ChatEntity.dart';
import 'package:flutter/material.dart';

import 'addImages.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatEntity) onSubmit;
  ChatInput({Key? key , required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final chatMessageController = TextEditingController();

  String _imageUrl = '';

  void onSendButtonPressed() {
    print('ChatMessage: ${chatMessageController.text}');
  }

  void sendMessage()
  {
    ChatEntity newMessageHere = ChatEntity(message: chatMessageController.text, id: "122", createdAt: DateTime.now().millisecondsSinceEpoch, author: Author(username:"Shubham"));
    print("Inside sendMessage but outside the if condition");
    if(_imageUrl.isNotEmpty)
      {
        newMessageHere.imageUrl = _imageUrl;
        print(" Inside sendMessage method url : ${newMessageHere.imageUrl}");
      }
    widget.onSubmit(newMessageHere);
    chatMessageController.clear();
    _imageUrl='';
    setState(() {});
  }

  void appendImage(String imageUrl)
  {

    setState(() {_imageUrl = imageUrl;});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(context: context, builder:(BuildContext context){
                return AddNewImages(sendImage: appendImage);
              });
              // AddNewImages();
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: Column(
                children: [
                  TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            controller: chatMessageController,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                    hintText: "Type your message",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none),
          ),
                  if(_imageUrl.isNotEmpty)
                  Image.network(_imageUrl , width: 100 , height: 100,)
                ],
              )),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    );
  }
}
