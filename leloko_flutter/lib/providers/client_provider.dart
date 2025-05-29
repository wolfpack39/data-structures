import 'package:flutter/material.dart';
import 'package:leloko_flutter/model/client_model.dart';

class ClientProvider extends ChangeNotifier {
  bool isLoading = false;

  final List<ClientModel> _clients = [
    ClientModel(
      clientId: '97127',
      clientName: "Ford Motor Company",
      clientAddress: "21 Moloto Drive Soshanguve",
      phoneNumber: '(012) 887-2388',
      numberOfTasks: 3
    ),
    ClientModel(
      clientId: '23928',
      clientName: "Moremi Wheels",
      clientAddress: "16 University Avenue, Hatfield",
      phoneNumber: '(012) 767-2388',
      numberOfTasks: 0
    ),
    ClientModel(
      clientId: '10133',
      clientName: "African Vision Milling",
      clientAddress: "Unit 17, Block 156, Centurion Drive, Pretoria",
      phoneNumber: '(012) 887-2388',
      numberOfTasks: 5 
    ),
  ];

  List<ClientModel> get clients => _clients;

  Future<void> getTrips() async {
    isLoading = true;
    notifyListeners();

    //_clients = response;
    isLoading = false;
    notifyListeners();
  }
}
