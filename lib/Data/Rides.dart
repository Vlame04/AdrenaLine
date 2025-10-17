class Rides {
  final int? id;
  final String name;
  final bool isOpen;
  final int? waitTime;

  const Rides({
    required this.id,
    required this.name,
    required this.isOpen,
    required this.waitTime,
  });

  factory Rides.fromJson(Map<String, dynamic> json) {
    return Rides(
      id: json['id'] as int?,
      name: json['name'] as String? ?? "Ride unknown",
      isOpen: json['is_open'] as bool,
      waitTime: json['wait_time'] as int?,
    );
  }

  static List<Rides> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => Rides.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}