import 'package:emobility/pages/aboutPage_components/about_page_content.dart';
import 'package:emobility/pages/appTheme/theme_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // For custom fonts

class About extends StatefulWidget {
  const About({super.key});

  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<About> with SingleTickerProviderStateMixin {
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
    Color primaryColor = ThemeClass().primaryAccent;

    TextStyle headingStyle = GoogleFonts.playfairDisplay(
      textStyle: TextStyle(
        color: primaryColor,
        fontSize: 30,
      ),
    );

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ListView(
        addAutomaticKeepAlives: true,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          // Heading for Leadership Team
          Text('Leadership Team', style: headingStyle),
          _buildDivider(primaryColor),
          const SizedBox(height: 10),
          _buildTeamList(0, context),
          const SizedBox(height: 20),

          // Heading for Advisory Board
          Text('Advisory Board', style: headingStyle),
          _buildDivider(primaryColor),
          const SizedBox(height: 10),
          _buildTeamList(1, context),
        ],
      ),
    );
  }

  // Method to build the divider under headings
  Widget _buildDivider(Color primaryColor) {
    return Container(
      height: 2,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  // Method to build the team list (Leadership/Advisory)
  Widget _buildTeamList(int memberIndex, BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        // Apply fade animation to each list tile with a delay
        return _customListTile(context, index, memberIndex);
      },
    );
  }

  // Custom list tile for team members with fade animation
  Widget _customListTile(BuildContext context, int index, int memberIndex) {
    // Adjust index for advisory board
    if (memberIndex == 1) {
      index = index + 5;
    }

    TextStyle titleStyle = GoogleFonts.lora(
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    );

    TextStyle descriptionStyle = GoogleFonts.lora(
      textStyle: const TextStyle(
        color: Colors.black54,
        fontSize: 13,
      ),
    );

    List<String> titles = AboutPageContent().titles;
    List<String> description = AboutPageContent().description;

    // Animation for individual tiles
    Animation<double> tileFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.1 * index, // delay for each tile
          0.1 * (index + 1),
        ),
      ),
    );

    return FadeTransition(
      opacity: tileFadeAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon or image placeholder
            Image.asset(
              'lib/images/accounts.png',
              scale: 7.5,
            ),
            const SizedBox(width: 10),

            // Column for title and description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(titles[index], style: titleStyle),
                const SizedBox(height: 5),

                // Divider under title
                Container(
                  color: Colors.green,
                  height: 1,
                  width: MediaQuery.sizeOf(context).width * 0.65,
                ),
                const SizedBox(height: 5),

                // Description
                Text(description[index], style: descriptionStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
