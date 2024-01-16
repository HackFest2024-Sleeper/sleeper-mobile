class Exercise {
  final String name;
  final String category;
  final String description;
  final int duration;
  final int repetitions;
  final int sets;
  final String image;

  Exercise({
    required this.name,
    required this.category,
    required this.description,
    required this.duration,
    required this.repetitions,
    required this.sets,
    required this.image,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'],
      category: json['category'],
      description: json['description'],
      duration: json['duration'],
      repetitions: json['repetitions'],
      sets: json['sets'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'duration': duration,
      'repetitions': repetitions,
      'sets': sets,
      'image': image,
    };
  }
}
