class RecipeModel {
  final String name;
  final String image;
  final double rating;
  final int prepTimeMinutes;
  final int servings;
  RecipeModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.prepTimeMinutes,
    required this.servings,
  });
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      name: json['name'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      prepTimeMinutes: json['prepTimeMinutes'],
      servings: json['servings'],
    );
  }
}
