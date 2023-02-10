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

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final charactersTabRouter =
        useMemoized<CharactersTabRouter>(() => CharactersTabRouter());
    final episodesTabRouter =
        useMemoized<EpisodesTabRouter>(() => EpisodesTabRouter());
    final locationsTabRouter =
        useMemoized<LocationsTabRouter>(() => LocationsTabRouter());
    final settingsTabRouter =
        useMemoized<SettingsTabRouter>(() => SettingsTabRouter());

    final currentTabIndex = useState<int>(0);

    final changeTab = useCallback((int index) {
      currentTabIndex.value = index;
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          TabPage(
            offstage: currentTabIndex.value != 0,
            router: charactersTabRouter,
          ),
          TabPage(
            offstage: currentTabIndex.value != 1,
            router: episodesTabRouter,
          ),
          TabPage(
            offstage: currentTabIndex.value != 2,
            router: locationsTabRouter,
          ),
          TabPage(
            offstage: currentTabIndex.value != 3,
            router: settingsTabRouter,
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
        onTap: changeTab,
        currentIndex: currentTabIndex.value,
      ),
    );
  }
}
