import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leloko_flutter/model/trip_model.dart';

class RequestHelper {
  static Future<List<TripModel>> getRequest(String url) async {
    http.Response response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodeData = jsonDecode(data) as List;
        final trips = decodeData.map((e) {
          return TripModel(
            tripId: e['tripId'],
            pickupAddress: e['pickupAddress'],
            destinationAddress: e['destinationAddress'],
            weight: e['weight'],
            plannedDate: e['plannedDate'],
            description: e['description'],
            update: e['update'],
            disabled: e['disabled'],
            status: e['status'],
          );
        }).toList();
        return trips;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception('Failed to load trip: $e');
    }
  }
}
