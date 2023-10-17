import 'dart:ui';

class SourceModel {
  String statusMsg;
  List<Source> sources;

  SourceModel({required this.statusMsg, required this.sources});

  SourceModel.fromJson(Map<String, dynamic> json)
      : this(
          statusMsg: json["status"],
          sources: List<Source>.from(
              json["sources"].map((e) => Source.fromJson(e))),
        );
}

class Source {
  String id;
  String name;
  String description;
  String imageUrl;
  String category;

  Source(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.category});

  Source.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          name: json["name"],
          description: json["description"],
          imageUrl: json["url"],
          category: json["category"],
        );
}

class Categories {

  String catName;
  Color catColor;
  String catImage;
  bool selected;

  Categories({
    required this.catName,
    required this.catColor,
    required this.catImage,
    this.selected = false,
  });
}
