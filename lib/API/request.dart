import 'dart:convert';

import 'package:adrenaline/Data/ParkOrganisation.dart';
import 'package:http/http.dart' as http;

import '../Data/Park.dart';

Future<String> request(String parameter) async {
  //The request to retrieve the queue times
  var url =
  Uri.https("queue-times.com", parameter);

  var response = await http.get(url);

  //Check if the response is successful
  if (response.statusCode == 200) {
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load park organisation');
  }
}

Future<List<ParkOrganisation>> fetchParks() async {
  String response = await request("parks.json");

  List<dynamic> jsonData = jsonDecode(response);
  return ParkOrganisation.fromJsonList(jsonData);
}

Future<Park> fetchParkWithRides(int? id) async {
  String response = await request("parks/$id/queue_times.json");

  final Map<String, dynamic> jsonData = jsonDecode(response);
  return Park.fromJson(jsonData);
}
