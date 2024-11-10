// lib/major_screen.dart

import 'package:emobility/pages/equipments.dart';
import 'package:emobility/pages/home.dart';
import 'package:emobility/pages/teams.dart';
import 'package:emobility/pages/projects.dart';
import 'package:flutter/material.dart';
import 'package:emobility/pages/appTheme/theme_class.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MajorScreen extends StatefulWidget {
  const MajorScreen({super.key});

  @override
  MajorScreenScreen createState() => MajorScreenScreen();
}

class MajorScreenScreen extends State<MajorScreen> {
  int selectedPage = 0; // Default selected page

  @override
  Widget build(BuildContext context) {
    Color primaryColor = ThemeClass().primaryAccent;
    Color secondaryColor = ThemeClass().secondaryAccent;
    PageController pageController = PageController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              controller: pageController,
              children: const [
                Home(),
                Teams(),
                EquipmentsPage(), // Ensure this is the correct reference
                Projects(),
              ],
            ),
            SafeArea(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: secondaryColor,
                      spreadRadius: 1,
                      blurRadius: 9,
                      offset: const Offset(1, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GNav(
                    duration: const Duration(milliseconds: 800),
                    selectedIndex: selectedPage,
                    color: primaryColor,
                    activeColor: Colors.white,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    onTabChange: (index) {
                      setState(() {
                        if ((selectedPage - index).abs() == 1) {
                          selectedPage = index;
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeIn,
                          );
                        } else {
                          pageController.jumpToPage(index);
                        }
                      });
                    },
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.people_alt_outlined,
                        text: 'Teams',
                      ),
                      GButton(
                        icon: Icons.build_rounded,
                        text: 'Equipments',
                      ),
                      GButton(
                        icon: Icons.collections_bookmark_outlined,
                        text: 'Projects',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
