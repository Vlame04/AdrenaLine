import 'package:adrenaline/API/request.dart';
import 'package:adrenaline/Data/Park.dart';
import 'package:flutter/material.dart';

class ParkScreenWidget extends StatefulWidget {
  final int? id;
  final String name;

  const ParkScreenWidget({super.key, required this.id, required this.name});

  @override
  _ParkScreenWidgetState createState() => _ParkScreenWidgetState();
}

class _ParkScreenWidgetState extends State<ParkScreenWidget> {
  late Future<Park> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchParkWithRides(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.name), centerTitle: true,),
        body: FutureBuilder<Park>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data found'));
            }

            final Park park = snapshot.data!;

            return ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  ...park.lands.map((land) => ExpansionTile(
                    title: Text(land.name),
                    initiallyExpanded: true,
                    children: land.rides.map((ride) => ListTile(
                      title: Text(ride.name),
                      subtitle: Text(ride.isOpen ? "${ride.waitTime}" : 'X'),
                    )).toList(),
                  )),
                  if (park.rides.isNotEmpty)
                    ExpansionTile(
                      title: const Text("Other rides"),
                      initiallyExpanded: true,
                      children: park.rides.map((ride) => ListTile(
                        title: Text(ride.name),
                        subtitle: Text(ride.isOpen ? "${ride.waitTime}" : 'X'),
                      )).toList(),
                    ),
                ],
            );
          },
        )
    );
  }
}
