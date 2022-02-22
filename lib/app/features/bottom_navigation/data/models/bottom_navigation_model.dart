class BottomNavigationModel {
  final int id;
  final String key;
  final String label;
  final String icon;

  const BottomNavigationModel({
    required this.id,
    required this.key,
    required this.label,
    required this.icon,
  });

  factory BottomNavigationModel.fromJson(Map<String, dynamic> json) =>
      BottomNavigationModel(
        id: json['id'] ?? 0,
        key: json['key'] ?? "",
        label: json['label'] ?? "",
        icon: json['icon'] ?? "",
      );

  static List<BottomNavigationModel> getListOfBottomNavigationsFromListOfJsons(
          List<dynamic> json) =>
      List.generate(
        json.length,
        (index) => BottomNavigationModel.fromJson(json[index]),
      );
}
