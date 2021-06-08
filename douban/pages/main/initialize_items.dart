import 'package:flutter/material.dart';
import '../group/group.dart';
import '../mall/mall.dart';
import '../profile/Profile.dart';
import '../subject/subject.dart';
import '../home/home_content.dart';
import '../../widgets/bottom_bar_item.dart';

// tabBar的item
List<BottomBarItem> items = [
  BottomBarItem(
    Icon(Icons.home_outlined, color: Colors.black26),
    "首页",
    activeIcon: Icon(Icons.home_outlined, color: Colors.green),
  ),
  BottomBarItem(
    Icon(Icons.menu_book_rounded, color: Colors.black26),
    "书影音",
    activeIcon: Icon(Icons.menu_book_rounded, color: Colors.green),
  ),
  BottomBarItem(
    Icon(Icons.group, color: Colors.black26),
    "小组",
    activeIcon: Icon(Icons.group, color: Colors.green),
  ),
  BottomBarItem(
    Icon(Icons.store_mall_directory, color: Colors.black26),
    "市集",
    activeIcon: Icon(Icons.store_mall_directory, color: Colors.green),
  ),
  BottomBarItem(
    Icon(Icons.person, color: Colors.black26),
    "我的",
    activeIcon: Icon(Icons.person, color: Colors.green),
  ),
];

// 每个page页
List<Widget> pages = [HomeContent(), Subject(), Group(), Mall(), Profile()];
