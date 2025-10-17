import 'package:adrenaline/API/request.dart';
import 'package:adrenaline/Data/ParkOrganisation.dart';
import 'package:flutter/material.dart';
import 'ParkScreenWidget.dart';

class ParksScreenWidget extends StatefulWidget {
  const ParksScreenWidget({super.key});

  @override
  _ParksScreenWidgetState createState() => _ParksScreenWidgetState();
}

class _ParksScreenWidgetState extends State<ParksScreenWidget> {
  late Future<List<ParkOrganisation>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchParks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adrenaline"), centerTitle: true,),
      body: FutureBuilder<List<ParkOrganisation>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          }

          List<ParkOrganisation>? orgs = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(8.0),
            children: orgs.map((org) => ExpansionTile(
              title: Text(org.name),
              initiallyExpanded: true,
              children: org.parks.map((park) => ElevatedButton(
                child: Text(park.name),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ParkScreenWidget(
                          id: park.id,
                          name: park.name))
                  );
                },
              )).toList(),
            )).toList()
          );
        },
      )
    );
  }
}
