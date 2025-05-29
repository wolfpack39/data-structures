import 'package:flutter/material.dart';
import 'package:leloko_flutter/model/trip_model.dart';

class TripProvider extends ChangeNotifier {
  bool isLoading = false;
  final List<TripModel> _trips = [
    TripModel(
      tripId: '97127',
      pickupAddress: "Waterfall Office Park, Midrand",
      destinationAddress: "No. 17, Block 7, Brynston Manor Office Park, Bryanston",
      weight: '78',
      description: "Parcel to be picked up on Friday",
      plannedDate: "2025-02-12",
      update: 'start',
      disabled: false,
      status: "Pending",
    ),
    TripModel(
      tripId: '32378',
      pickupAddress: "12 Morningside Manor, Sandton",
      destinationAddress: "9 Cedar Road, Fourways",
      weight: '65',
      description: "17 pallets to be picked up before 12 on Tuesday",
      plannedDate: "2025-03-01",
      update: 'start',
      disabled: true,
      status: "Completed",
    ),
    TripModel(
      tripId: '82973',
      pickupAddress: "28 Vona Valley, Midrand 1687",
      destinationAddress: "17 Cedar Avenue, ",
      weight: '110',
      description: "Please call Nick when you arrive at the gate",
      plannedDate: "2025-08-19",
      update: 'pause',
      disabled: false,
      status: "In Transit",
    ),
  ];

  List<TripModel> get trips => _trips;

  Future<void> getTrips() async {
    isLoading = true;
    notifyListeners();

    //_trips = response;
    print(_trips);
    isLoading = false;
    notifyListeners();
  }
}
