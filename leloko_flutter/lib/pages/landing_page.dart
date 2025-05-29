import 'package:flutter/material.dart';
import 'package:leloko_flutter/pages/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<StatefulWidget> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  int _selectedIndex = 0;
  bool wideScreen = false;
  double groupAlignment = -1;

  _onItemtapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double width = MediaQuery.of(context).size.width;
    wideScreen = width > 600;
  }

  List<Widget> pages = [
    HomePage(),
    Text('Index 1'),
    Text('Index 2'),
    Text('Index 3')
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
        children: [
          if (wideScreen) 
            NavigationRail(
              groupAlignment: groupAlignment,
              labelType: labelType,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined), label: Text('Home')
                )
              ],
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemtapped,
            ),
            Expanded(
              child: Center(
                child: pages[_selectedIndex],
              )
            )
        ],
      ),
      bottomNavigationBar: wideScreen
        ? null
        : BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: colorScheme.surface,
          selectedItemColor: Color.fromRGBO(7, 130, 42, 1),
          unselectedItemColor: Color.fromRGBO(8, 7, 7, 0.71),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(label: 'Jobs', icon: Icon(Icons.music_note)),
            BottomNavigationBarItem(label: 'Stats', icon: Icon(Icons.music_note)),
            BottomNavigationBarItem(label: 'Account', icon: Icon(Icons.person))
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemtapped,
      ),
    );
  }
}
