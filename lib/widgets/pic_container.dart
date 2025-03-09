import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PicContainer extends StatefulWidget {
  const PicContainer({
    super.key,
    this.pic,
  });

  final XFile? pic;

  @override
  _PicContainerState createState() => _PicContainerState();
}

class _PicContainerState extends State<PicContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 3, color: Colors.transparent),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.deepPurple, Colors.deepOrange],
                  stops: [0.3, 1])),
          width: 150,
          height: 150,
          child: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage:
                  widget.pic != null ? FileImage(File(widget.pic!.path)) : null,
              child: Icon(CupertinoIcons.add, color: Colors.deepOrange)),
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
