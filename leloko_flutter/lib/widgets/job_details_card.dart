import 'package:flutter/material.dart';
import 'package:leloko_flutter/model/trip_model.dart';
import 'package:leloko_flutter/utils/globals.dart';

class JobDetailsCard extends StatefulWidget {
  final TripModel tripModel;

  const JobDetailsCard({super.key, required this.tripModel});

  @override
  State<JobDetailsCard> createState() => _JobDetailsPage();
}

class _JobDetailsPage extends State<JobDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/dan_avatar.jpeg'),
                  radius: 50,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mike Moloto', style: Globals.blackLarge),
                  Text('Assigned Driver', style: Globals.blackSmall),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green[50],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: 110,
                        child: Row(
                          children: [
                            Icon(
                              widget.tripModel.status == 'In Transit'
                                  ? Icons.car_crash_outlined
                                  : Icons.remove_circle_outline_sharp,
                              color:
                                  widget.tripModel.status == 'In Transit'
                                      ? Colors.orangeAccent
                                      : Colors.red[500],
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.tripModel.status,
                              style:
                                  widget.tripModel.status == 'Pending'
                                      ? TextStyle(color: Colors.red[600])
                                      : TextStyle(color: Colors.orange[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Accepted on', style: Globals.blackMedium),
                        Text('12/08/2025', style: Globals.blackSmall),
                      ],
                    ),

                    ElevatedButton(
                      onPressed:
                          widget.tripModel.status == 'Complete'
                              ? null
                              : _startTrip,
                      child:
                          widget.tripModel.status == 'Pending'
                              ? Text('Start Trip')
                              : Text('Update Trip'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _startTrip() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return const Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 15),
                Text('Please wait...'),
              ],
            ),
          ),
        );
      },
    );

    updateStatus().then((value) {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  Future<void> updateStatus() async {
    await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      if (widget.tripModel.status == 'Pending') {
        setState(() {
          widget.tripModel.status = 'In Transit';
        });
      } else {
        setState(() {
          widget.tripModel.status = 'Completed';
          widget.tripModel.disabled = true;
        });
      }
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }
}
