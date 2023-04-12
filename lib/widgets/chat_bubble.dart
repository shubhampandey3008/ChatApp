import 'package:chat_app/models/ChatEntity.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatEntity entity;
  final Alignment alignment;
  final Color colorPassed;

  const ChatBubble({Key? key, required this.alignment, required this.entity, required this.colorPassed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.5
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${entity.message}',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            verticalSpacing(5),
            if(entity.imageUrl!=null)
            Image.network(
              '${entity.imageUrl}',
              height: 100,
            )
          ],
        ),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colorPassed,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
      ),
    );
  }
}
