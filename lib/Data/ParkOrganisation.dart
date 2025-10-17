import 'Parks.dart';

class ParkOrganisation {
  final int? id;
  final String name;
  final List<Parks> parks;

  const ParkOrganisation({required this.id, required this.name, required this.parks});

  factory ParkOrganisation.fromJson(Map<String, dynamic> json) {
    if (json['parks'] is List) {
      List<dynamic> parksList = json['parks'] as List;

      return ParkOrganisation(
        id: json['id'] as int?,
        name: json['name'] as String,
        parks: Parks.fromJsonList(parksList), // Parse list of parks
      );
    }

    throw Exception('Parks data is not in expected list format');
  }

  static List<ParkOrganisation> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => ParkOrganisation.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}