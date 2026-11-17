
class Category {
  final String id;
  final String name;
  final String image;
  final String description;

  const Category({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['idCategory']?.toString() ?? '',
      name: json['strCategory']?.toString() ?? '',
      image: json['strCategoryThumb']?.toString() ?? '',
      description:
          json['strCategoryDescription']?.toString() ?? '',
    );
  }
}
