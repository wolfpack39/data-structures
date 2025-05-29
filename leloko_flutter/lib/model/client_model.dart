class ClientModel {
  String clientId;
  String clientName;
  String clientAddress;
  String phoneNumber;
  String? clientContactPerson;
  int numberOfTasks;

  ClientModel({
    required this.clientId,
    required this.clientName,
    required this.clientAddress,
    required this.phoneNumber,
    required this.numberOfTasks
  });
}
