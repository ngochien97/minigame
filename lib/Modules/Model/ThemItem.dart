// ignore_for_file: file_names

class ThemeItem {
  int id;
  String name;

  ThemeItem({
    required this.id,
    required this.name,
  });

  factory ThemeItem.fromJson(Map<String, dynamic> json) {
    final user = ThemeItem(
      id: json['id'],
      name: json['name'],
    );

    return user;
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
