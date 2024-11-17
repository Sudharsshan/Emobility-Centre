import 'package:emobility/pages/teamsPage_components/teams_tile_builder.dart';
import 'package:flutter/material.dart';
import 'package:emobility/pages/teamsPage_components/teams_page_content.dart';
import 'package:google_fonts/google_fonts.dart'; // Import for custom fonts
import '../appTheme/theme_class.dart';

class TeamsPageTiles extends StatefulWidget {
  const TeamsPageTiles({super.key});

  @override
  TeamsPageTilesState createState() => TeamsPageTilesState();
}

class TeamsPageTilesState extends State<TeamsPageTiles>
    with SingleTickerProviderStateMixin {
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
    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Defining colors
    Color primaryColor = ThemeClass().primaryAccent;
    Color secondaryColor = ThemeClass().secondaryAccent;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Heading quote with Playfair Display font
          Center(
            child: Text(
              'Every journey starts from a single step',
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(fontSize: 24, color: primaryColor),
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          // List of team members with fade-in animation
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return TeamsTileBuilder()
                      .teamTiles(index, primaryColor, secondaryColor, context);
                },
              ),
            ),
          ),

          // SizedBox to prevent nav bar overflow on screen context
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
