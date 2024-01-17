class Food {
  final String name;
  final String category;
  final String description;
  final String image;

  Food({
    required this.name,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json['name'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }
}
