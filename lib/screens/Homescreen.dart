import 'dart:io';
import 'package:camera/model/db_model/db_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'folder.dart';
import '../model/db_model/db_function.dart';

File? photo1;

class Homecsreen extends StatefulWidget {
  const Homecsreen({super.key});

  @override
  State<Homecsreen> createState() => _HomecsreenState();
}

class _HomecsreenState extends State<Homecsreen> {
  String? image;

  @override
  Widget build(BuildContext context) {
    getallimage();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'WELCOME',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Flexible(
              flex: 7,
              child: Folder(),
            ),
            Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                              onPressed: () {
                                fromgallery();
                              },
                              icon: const Icon(Icons.image_sharp),
                              label: const Text('Gallery')),
                          const SizedBox(
                            width: 30,
                          ),
                          ElevatedButton.icon(
                              onPressed: () {
                                fromcamera();
                              },
                              icon: const Icon(Icons.camera),
                              label: const Text('Camera'))
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future<void> fromcamera() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.camera);

    if (img1 != null) {
      setState(() {
        photo1 = File(img1.path);
        image = photo1!.path;
      });
      final imageModel = imagemodel(image: image!);
      addphoto(imageModel);
    }
  }

  Future<void> fromgallery() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img1 != null) {
      setState(() {
        photo1 = File(img1.path);
        image = photo1!.path;
      });
      final imageModel = imagemodel(image: image!);
      addphoto(imageModel);
    }
  }
}
