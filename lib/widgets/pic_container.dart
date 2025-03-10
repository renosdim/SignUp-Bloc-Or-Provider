import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PicContainer extends StatefulWidget {
  final XFile? pic;
  final Function(XFile)? onPicChanged;
  const PicContainer({
    super.key,
    this.pic,
    this.onPicChanged
  });

  
  @override
  _PicContainerState createState() => _PicContainerState();
}

class _PicContainerState extends State<PicContainer> {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedImage = null;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        GestureDetector(
          onTap: () async {
            if (widget.onPicChanged != null) {
              final XFile? image = await imagePicker.pickImage(
                  source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  pickedImage = image;
                });
                widget.onPicChanged!(pickedImage!);
              }
            }
          },
          child: Container(
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
                    widget.pic != null ? FileImage(File(widget.pic!.path)) : (pickedImage != null? FileImage(File(pickedImage!.path)): null),
                child: widget.pic == null && pickedImage == null ? Icon(CupertinoIcons.add, color: Colors.deepOrange) : Container()),
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
