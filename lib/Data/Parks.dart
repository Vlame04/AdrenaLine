class Parks {
  final int? id;
  final String name;
  final String? country;  // Optional field
  final String? continent; // Optional field
  final String? latitude;  // Optional field
  final String? longitude; // Optional field
  final String? timezone;  // Optional field

  const Parks({
    required this.id,
    required this.name,
    this.country,
    this.continent,
    this.latitude,
    this.longitude,
    this.timezone,
  });

  factory Parks.fromJson(Map<String, dynamic> json) {
    return Parks(
      id: json['id'] as int?,
      name: json['name'] as String? ?? "Parks unknown",
      country: json['country'] as String?,
      continent: json['continent'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      timezone: json['timezone'] as String?,
    );
  }

  // Method to convert a List<dynamic> to List<Parks>
  static List<Parks> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => Parks.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}