
class AppVersion{
  String description;
  int version;
  bool forceUpdate;

  AppVersion({required this.description, required this.version, required this.forceUpdate});

  factory AppVersion.fromJson(Map<String, dynamic> json) {
    return AppVersion(
      description: json['description'],
      version: json['version'],
      forceUpdate: json['force_update'],
    );
  }
}