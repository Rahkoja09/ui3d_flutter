import 'package:flutter/material.dart';
import 'package:ui3d_defi/views/home/home.dart';

class Bottombar extends StatefulWidget {
  final Function(int index) onTap;
  const Bottombar({super.key, required this.onTap});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 1,
      selectedItemColor: null,
      selectedIconTheme: IconThemeData(color: Colors.blueAccent),
      selectedLabelStyle: TextStyle(color: Colors.black54),
      iconSize: 25,
      onTap: widget.onTap,
      currentIndex: page,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            color: const Color.fromARGB(255, 27, 27, 27),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.drive_eta_rounded,
            color: const Color.fromARGB(225, 27, 27, 27),
          ),
          label: "Walking",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings_accessibility_outlined,
            color: const Color.fromARGB(225, 27, 27, 27),
          ),
          label: "History",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.wallet,
            color: const Color.fromARGB(225, 27, 27, 27),
          ),
          label: "Buy It",
        ),
      ],
    );
  }
}
