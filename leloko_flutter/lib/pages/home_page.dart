import 'package:flutter/material.dart';
import 'package:leloko_flutter/providers/client_provider.dart';
import 'package:leloko_flutter/utils/globals.dart';
import 'package:leloko_flutter/widgets/client_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ClientProvider>(context, listen: false).getTrips();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final clients = value.clients;

        return Padding(
          padding: EdgeInsets.only(top: 100, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Clients', style: Globals.extraLarge,),
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  ClientCard(clientModel: clients[0],), 
                  ClientCard(clientModel: clients[1],), 
                  ClientCard(clientModel: clients[2],)],
              ),
            ],
          ),
        );
      },
    );
  }
}
