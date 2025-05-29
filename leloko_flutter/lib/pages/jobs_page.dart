import 'package:flutter/material.dart';
import 'package:leloko_flutter/pages/trip_tile.dart';
import 'package:leloko_flutter/providers/trip_provider.dart';
import 'package:leloko_flutter/widgets/custom_divider.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPage();
}

class _JobsPage extends State<JobsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TripProvider>(context, listen: false).getTrips();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Consumer<TripProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final trips = value.trips;
         return Scaffold(
          appBar: AppBar(title: const Text('Assigned Tasks')),
          body: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: ListView.builder(
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  final trip = trips[index];
                  return Column(
                    children: [
                      TripTile(tripModel: trip),
                      CustomDivider()
                    ],
                  );
                },
              ),
            )
          ),
        );

      },
    );
  }
}
