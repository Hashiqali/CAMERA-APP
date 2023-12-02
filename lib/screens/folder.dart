import 'package:camera/screens/imagepage.dart';
import 'package:flutter/material.dart';

class Folder extends StatelessWidget {
  const Folder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const imagepage();
              }));
            },
            child: const Card(
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.folder,
                    color: Colors.deepPurple,
                    size: 60,
                  ),
                  Text(
                    'images',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          );
        });
  }
}
