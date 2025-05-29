import 'package:flutter/material.dart';
import 'package:leloko_flutter/model/trip_model.dart';
import 'package:leloko_flutter/pages/job_details_page.dart';
import 'package:leloko_flutter/utils/globals.dart';

class TripTile extends StatefulWidget {
  final TripModel tripModel;

  const TripTile({super.key, required this.tripModel});

  @override
  State<TripTile> createState() => _TripTile();
}

class _TripTile extends State<TripTile> {
  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (!widget.tripModel.disabled) {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JobDetailsPage(tripModel: widget.tripModel),
            ),
          );
          rebuild();
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('./images/pin.png'),
                  height: 16,
                  width: 16,
                ),
                const SizedBox(
                  height: 26,
                  width: 2,
                  child: ColoredBox(color: Color(0xFFe2e2e2)),
                ),
                Image(
                  image: AssetImage('images/square.png'),
                  height: 16,
                  width: 16,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  widget.tripModel.pickupAddress,
                  style: Globals.blackSmall,
                ),
              ),
              SizedBox(height: 22),
              SizedBox(
                width: 240,
                child: Text(widget.tripModel.destinationAddress),
              ),
            ],
          ),
          //SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('status', style: Globals.blackSmall),
              Text(
                widget.tripModel.status,
                style: TextStyle(
                  color:
                      widget.tripModel.status == 'Completed'
                          ? Colors.green
                          : widget.tripModel.status == 'In Transit'
                          ? Colors.orange
                          : Colors.red,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.tripModel.disabled ? Colors.grey : Colors.green,
                ),
                child: Text(
                  'Update Trip',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
