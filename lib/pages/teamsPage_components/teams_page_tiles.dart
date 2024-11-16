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
                  return teamTiles(index, primaryColor, secondaryColor);
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

  // Tile widget
  Widget teamTiles(int index, Color primaryColor, Color secondaryColor) {
    // Team member data logic remains the same

    int memberCount = 0, memberIndex = 0;

    switch (index) {
      case 0:
        memberIndex += 0;
        memberCount = 5;
        break;
      case 1:
        memberIndex += 5;
        memberCount = 26;
        break;
      case 2:
        memberIndex += 31;
        memberCount = 5;
        break;
      case 3:
        memberIndex += 36;
        memberCount = 5;
        break;
      case 4:
        memberIndex += 42;
        memberCount = 5;
        break;
      case 5:
        memberIndex += 47;
        memberCount = 5;
        break;
      case 6:
        memberIndex += 52;
        memberCount = 5;
        break;
    }

    // Initialize team details
    List<String> titles = TeamsPageContent().titles;
    List<String> members = TeamsPageContent().members;

    // Setting heading and context text style using Playfair Display and Lora
    TextStyle headingStyle = GoogleFonts.playfairDisplay(
      textStyle: TextStyle(
        color: primaryColor,
        fontSize: 24,
      ),
    );

    TextStyle contextStyle = GoogleFonts.lora(
      textStyle: TextStyle(
        color: secondaryColor,
        fontSize: 16,
      ),
    );

    String title = (index == 0) ? "Leading team" : titles[index - 1];

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Icon and vertical line design
        SizedBox(
          width: 22,
          child: Column(
            children: [
              const SizedBox(height: 28),
              const Icon(Icons.battery_0_bar),
              const SizedBox(height: 5),
              Container(
                height: memberCount * 20.0,
                width: 2,
                color: secondaryColor,
              ),
            ],
          ),
        ),

        // Team members tiles with updated styling and minimal design
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 4),
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Team name
              Text(title, style: headingStyle),
              const SizedBox(height: 5),

              // Divider
              Container(
                height: 1.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 10),

              // Team members
              SizedBox(
                height: 23.25 * memberCount,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: memberCount,
                  itemBuilder: (context, index) {
                    return Text('• ${members[memberIndex + index]}',
                        style: contextStyle);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
