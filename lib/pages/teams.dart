import 'package:emobility/pages/teamsPage_components/teams_page_tiles.dart';
import 'package:flutter/material.dart';

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  TeamsScreen createState() => TeamsScreen();
}

class TeamsScreen extends State<Teams> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return FadeTransition(
      opacity: _fadeAnimation,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TeamsPageTiles(), // This will contain the team tiles
            ),
          ],
        ),
      ),
    );
  }
}
