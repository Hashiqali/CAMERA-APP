import 'dart:io';
import 'package:camera/model/db_model/db_function.dart';
import 'package:camera/model/db_model/db_model.dart';
import 'package:flutter/material.dart';

class imagepage extends StatefulWidget {
  const imagepage({super.key});

  @override
  State<imagepage> createState() => _imagepageState();
}

class _imagepageState extends State<imagepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'images',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: imagelistNotifer,
              builder: (BuildContext ctx, List<imagemodel> imagelist,
                  Widget? child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: imagelist.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final data = imagelist[index];
                      return GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    content: Image(
                                        width: 300,
                                        image: FileImage(File(data.image))),
                                    actions: [
                                      Center(
                                        child: IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'if you want to delete'),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text('No')),
                                                        TextButton(
                                                            onPressed: () {
                                                              deleteimage(
                                                                  data.id);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text('Yes')),
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: const Icon(Icons.delete)),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Image(image: FileImage(File(data.image))));
                    },
                  ),
                );
              })),
    );
  }
}
