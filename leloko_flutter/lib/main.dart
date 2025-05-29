import 'package:flutter/material.dart';
import 'package:leloko_flutter/providers/client_provider.dart';
import 'package:leloko_flutter/providers/trip_provider.dart';
import 'package:provider/provider.dart';
import 'package:leloko_flutter/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TripProvider()),
        ChangeNotifierProvider(create: (context) => ClientProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Leloko Transport',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true,
        ),
        home: const LandingPage(),
      ),
    );
  }
}
