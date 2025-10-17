import 'ParkLand.dart';
import 'Rides.dart';

class Park {
  final int? id;
  final String name;
  final List<ParkLand> lands;
  final List<Rides> rides;

  const Park({
    required this.id,
    required this.name,
    required this.lands,
    required this.rides
  });

  factory Park.fromJson(Map<String, dynamic> json) {
      return Park(
        id: json['id'] as int?,
        name: json['name'] as String? ?? "Park unknown",
        lands: (json['lands'] as List?)?.map((e) => ParkLand.fromJson(e))
            .toList() ?? [],
        rides: (json['rides'] as List?)?.map((e) => Rides.fromJson(e))
            .toList() ?? [],
      );
  }

  // Method to convert a List<dynamic> to List<Park>
  static List<Park> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => Park.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
