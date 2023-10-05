import 'package:flutter/material.dart';
import 'package:namer_app/pages/FavoritesPage.dart';

import '../MenuItem.dart';
import 'GeneratorPage.dart';

class AppPage extends StatefulWidget {
  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  var selectedIndex = 0;

  var menuItems = [
    MenuItem(Icons.home, 'Home'),
    MenuItem(Icons.favorite, 'Favorites'),
  ];

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var mainArea = ColoredBox(
      color: colorScheme.primaryContainer,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: getMainPage(),
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return portraitLayout(mainArea);
          } else {
            return landscapeLayout(constraints, mainArea);
          }
        },
      ),
    );
  }

  Column portraitLayout(ColoredBox mainArea) {
    return Column(
      children: [
        Expanded(child: mainArea),
        BottomNavigationBar(
          items: [
            for (var item in menuItems)
              BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.label,
              ),
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      ],
    );
  }

  Row landscapeLayout(BoxConstraints constraints, ColoredBox mainArea) {
    return Row(
      children: [
        SafeArea(
          child: NavigationRail(
            extended: constraints.maxWidth >= 600,
            destinations: [
              for (var item in menuItems)
                NavigationRailDestination(
                  icon: Icon(item.icon),
                  label: Text(item.label),
                ),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          ),
        ),
        Expanded(child: mainArea),
      ],
    );
  }

  Widget getMainPage() {
    return switch (selectedIndex) {
      0 => GeneratorPage(),
      1 => FavoritesPage(),
      _ => throw UnimplementedError('no widget for $selectedIndex')
    };
  }
}
