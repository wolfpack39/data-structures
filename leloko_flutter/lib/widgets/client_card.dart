import 'package:flutter/material.dart';
import 'package:leloko_flutter/model/client_model.dart';
import 'package:leloko_flutter/pages/jobs_page.dart';

class ClientCard extends StatelessWidget {
  final ClientModel clientModel;

   const ClientCard({super.key, required this.clientModel});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(clientModel.clientName, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),),
                Text(clientModel.clientAddress, style: TextStyle(fontSize: 12),)
              ],
            ),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 140,
                  height: 40,
                    child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JobsPage()),
                      );
                    }, 
                    child: Text('VIEW TASTS (${clientModel.numberOfTasks})', style: TextStyle(fontSize: 12),)
                  ),
                )
              ],
            ),
            const SizedBox(width: 20,)
        ],
      ) 
    );
  }
}
