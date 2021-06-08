import 'package:flutter/material.dart';

class BottomBarItem extends BottomNavigationBarItem {
  BottomBarItem(Widget icon, String label, {Widget activeIcon})
      : super(
    icon: icon,
    activeIcon: activeIcon,
    label: label,
  );
}