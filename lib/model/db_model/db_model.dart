class imagemodel {
  int? id;
  final String image;

  imagemodel({required this.image, this.id});

  static imagemodel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final image = map['img'] as String;

    return imagemodel(image: image, id: id);
  }
}
