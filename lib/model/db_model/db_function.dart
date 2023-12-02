import 'package:camera/model/db_model/db_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<imagemodel>> imagelistNotifer = ValueNotifier([]);

late Database db;

Future<void> createdatabase() async {
  db = await openDatabase('image.db', version: 1,
      onCreate: (Database db, int version) {
    db.execute('CREATE TABLE image(id INTEGER PRIMARY KEY,img TEXT)');
  });
}

Future<void> addphoto(imagemodel value) async {
  await db.execute('INSERT INTO image(img)VALUES(?)', [value.image]);
  getallimage();
}

Future<void> getallimage() async {
  final values = await db.rawQuery('SELECT * FROM image');
  imagelistNotifer.value.clear();

  values.forEach((map) {
    final images = imagemodel.fromMap(map);
    imagelistNotifer.value.add(images);
  });
  imagelistNotifer.notifyListeners();
}

Future<void> deleteimage(id) async {
  await db.delete('image', where: 'id=?', whereArgs: [id]);
  getallimage();
}
