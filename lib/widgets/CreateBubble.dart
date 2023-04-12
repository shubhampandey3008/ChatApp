import'package:flutter/material.dart';

class CreateBubble extends StatelessWidget {
  final Alignment alignment;
  final String message;

  const CreateBubble({Key? key, required this.alignment, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.network(
                  'https://www.desicomments.com/wp-content/uploads/2022/03/Good-Day4.jpg',
                  height: 200),
            )
          ],
        ),
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
      ),
    );
  }
}
