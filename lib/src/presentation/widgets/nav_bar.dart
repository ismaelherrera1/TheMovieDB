import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../../core/util/widget_keys.dart';

class NavBar extends StatefulWidget {
  int milliseconds = 200;
  int selectedItem;
  PageController controller;
  NavBar({
    super.key,
    required this.selectedItem,
    required this.controller,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return BottomNavigationBar(
      key: const Key(
        Keys.navBarBNB,
      ),
      currentIndex: widget.selectedItem,
      onTap: (index) {
        widget.selectedItem = index;
        widget.controller.animateToPage(
          widget.selectedItem,
          duration: Duration(
            milliseconds: widget.milliseconds,
          ),
          curve: Curves.ease,
        );
      },
      selectedItemColor: Colors.red.shade400,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.movie_outlined,
          ),
          activeIcon: Icon(
            Icons.movie,
          ),
          label: UIConstants.navBarHomeLabel,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            key: Key(
              Keys.navBarHelpIcon,
            ),
            Icons.help_outline,
          ),
          activeIcon: Icon(
            key: Key(
              Keys.navBarHelpIconActive,
            ),
            Icons.help,
          ),
          label: UIConstants.navBarAboutUsLabel,
        ),
      ],
    );
  }
}
