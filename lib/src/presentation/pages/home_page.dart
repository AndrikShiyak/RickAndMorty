import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/episodes_tab_router.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/locations_tab_router.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/settings_tab_router.dart';
import '../../config/routes/characters_tab_router.dart';
import 'tab_page.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulHookWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CharactersTabRouter _charactersTabRouter = CharactersTabRouter();
  final EpisodesTabRouter _episodesTabRouter = EpisodesTabRouter();
  final LocationsTabRouter _locationsTabRouter = LocationsTabRouter();
  final SettingsTabRouter _settingsTabRouter = SettingsTabRouter();

  int _currentTabIndex = 0;

  void _changeTab(int index) => setState(() {
        _currentTabIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabPage(
            offstage: _currentTabIndex != 0,
            router: _charactersTabRouter,
          ),
          TabPage(
            offstage: _currentTabIndex != 1,
            router: _episodesTabRouter,
          ),
          TabPage(
            offstage: _currentTabIndex != 2,
            router: _locationsTabRouter,
          ),
          TabPage(
            offstage: _currentTabIndex != 3,
            router: _settingsTabRouter,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Characters'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Episodes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: 'Locations'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (int index) => _changeTab(index),
        currentIndex: _currentTabIndex,
      ),
    );
  }
}
