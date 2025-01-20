import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../App_Theme_Utils/app_theme_export.dart';
import '../Icons_Utils/icons_export.dart';
import '../Constants/constants_export.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      selectedIconTheme:
          Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
      unselectedIconTheme:
          Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
      selectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Home',
          icon: const Icon(Icons.home),
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        BottomNavigationBarItem(
          label: 'Search',
          icon: const Icon(Icons.search),
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        BottomNavigationBarItem(
          label: 'New & Hot',
          icon: SvgPicture.asset(
            svgFlash,
            height: 25,
            colorFilter: const ColorFilter.mode(
              ThemeConstants.textSecondryColor,
              BlendMode.srcIn,
            ),
          ),
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        BottomNavigationBarItem(
          label: 'Downloads',
          icon: const Icon(Icons.file_download),
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        BottomNavigationBarItem(
          label: 'My Space',
          icon: const Icon(Icons.person_outline_outlined),
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() => selectedIndex = index);

    switch (index) {
      case 0:
        Modular.to.pushNamed(Routes.homeScreen);

        break;
      case 1:
        Modular.to.pushNamed(Routes.searchScreen);

        break;
      case 2:
        Modular.to.pushNamed(Routes.newAndHotScreen);

        break;
      case 3:
        Modular.to.pushNamed(Routes.downloadsScreen);

        break;
      case 4:
        Modular.to.pushNamed(Routes.mySpaceScreen);

        break;
    }
  }
}
