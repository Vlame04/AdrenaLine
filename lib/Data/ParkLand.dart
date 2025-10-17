import 'Rides.dart';

class ParkLand {
  final int? id;
  final String name;
  final List<Rides> rides;

  const ParkLand({
    required this.id,
    required this.name,
    required this.rides,
  });

  factory ParkLand.fromJson(Map<String, dynamic> json) {
    return ParkLand(
      id: json['id'] as int?,
      name: json['name'] as String? ?? "Park Land unknown",
      rides: (json['rides'] as List?)?.map((e) => Rides.fromJson(e))
          .toList() ?? [],
    );
  }

  static List<ParkLand> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => ParkLand.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}