import 'package:flutter/material.dart';
import 'package:leloko_flutter/model/trip_model.dart';
import 'package:leloko_flutter/widgets/job_details_card.dart';

class JobDetailsPage extends StatelessWidget {
  final TripModel tripModel;

  const JobDetailsPage({super.key, required this.tripModel});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
      body: Center(
        child: JobDetailsCard(tripModel: tripModel,)
      ),
    );
  }
}
