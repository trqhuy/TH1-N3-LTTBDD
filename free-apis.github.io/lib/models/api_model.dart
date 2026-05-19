class ApiModel {
  final String title;
  final String description;
  final String authType; // "No authorization", "API key authorization"
  final bool isHttps;
  final bool isCors;

  ApiModel({
    required this.title,
    required this.description,
    required this.authType,
    required this.isHttps,
    required this.isCors,
  });
}
