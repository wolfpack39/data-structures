class TripModel {
  String tripId;
  String pickupAddress;
  String destinationAddress;
  String weight;
  String description;
  String plannedDate;
  String update;
  bool disabled;
  String status;

  TripModel({
    required this.tripId,
    required this.pickupAddress,
    required this.destinationAddress,
    required this.weight,
    required this.description,
    required this.plannedDate,
    required this.update,
    required this.disabled,
    required this.status,
  });
}
