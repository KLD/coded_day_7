class BookModel {
  String title;
  String description;
  String image;

  BookModel({
    required this.title,
    required this.description,
    required this.image,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}

// BookModel bookModelfromJson(Map<String, dynamic> json) {
//   return BookModel(
//     title: json['title'],
//     description: json['description'],
//     image: json['image'],
//   );
// }