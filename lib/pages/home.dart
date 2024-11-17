import 'package:emobility/pages/homePage_components/home_page_content.dart';
import 'package:emobility/pages/homePage_components/time_line_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:emobility/pages/appTheme/theme_class.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeScreen createState() => HomeScreen();
}

class HomeScreen extends State<Home> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
// Setting the default scroll position to 0

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollPosition);

    // Initialize AnimationController and Animation
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

  void _updateScrollPosition() {
    setState(() {});
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollPosition);
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set the app primary color from theme class
    Color primaryColor = ThemeClass().primaryAccent;
    Color secondaryColor = ThemeClass().secondaryAccent;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: homeScreen(context, primaryColor, secondaryColor),
      ),
    );
  }

  Widget homeScreen(
      BuildContext context, Color primaryColor, Color secondaryColor) {
    // Setting all heading text style
    TextStyle headingStyle = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w800,
      fontSize: 24,
      fontFamily: 'PlayfairDisplay',
    );

    // Setting all context text style
    TextStyle contextStyle = TextStyle(
      color: secondaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontFamily: 'Lora',
    );

    // Fetching the data to be shown on home screen
    String visionContext = HomePageContent().visionContext;
    String missionContext = HomePageContent().missionContext;
    String objectivesContext = HomePageContent().objectivesContext;
    String introductions_1 = HomePageContent().introductions_1;
    String introductions_2 = HomePageContent().introductions_2;
    String introductions_3 = HomePageContent().introductions_3;

    // Modify this color later for custom background colors for the home page boxes
    final Color backgroundFill = ThemeClass().cremeGreen.withOpacity(0.6);

    return ListView(
      addAutomaticKeepAlives: true,
      controller: _scrollController,
      children: [
        // Introduction box
        TimeLineItemBuilder().TimeLineBuilder(
          context: context,
          title: 'Introduction',
          descriptions: [
            introductions_1,
            introductions_3,
          ],
          icon: Icons.battery_charging_full,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          headingStyle: headingStyle,
          contextStyle: contextStyle,
          index: 0,
          gridView: false,
          backgroundFill: backgroundFill,
        ),

        // Key areas box
        TimeLineItemBuilder().TimeLineBuilder(
          context: context,
          title: 'Key Areas',
          descriptions: introductions_2
              .split('\n')
              .where((line) => line.trim().isNotEmpty)
              .toList(),
          icon: Icons.bolt,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          headingStyle: headingStyle,
          contextStyle: contextStyle,
          index: 1,
          gridView: true,
          backgroundFill: backgroundFill,
        ),

        // Vision box
        TimeLineItemBuilder().TimeLineBuilder(
          context: context,
          title: 'Vision',
          descriptions: [visionContext],
          icon: Icons.lightbulb,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          headingStyle: headingStyle,
          contextStyle: contextStyle,
          index: 2,
          gridView: false,
          backgroundFill: backgroundFill,
        ),

        // Our mission box
        TimeLineItemBuilder().TimeLineBuilder(
          context: context,
          title: 'Our Mission',
          descriptions: [missionContext],
          icon: Icons.aod,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          headingStyle: headingStyle,
          contextStyle: contextStyle,
          index: 3,
          gridView: false,
          backgroundFill: backgroundFill,
        ),

        // Goals and objectives box
        TimeLineItemBuilder().TimeLineBuilder(
          context: context,
          title: 'Goals & Objectives',
          descriptions: [objectivesContext],
          icon: Icons.settings,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          headingStyle: headingStyle,
          contextStyle: contextStyle,
          index: 4,
          gridView: false,
          backgroundFill: backgroundFill,
        ),

        // Additional box to keep the last widget above the navigation bar
        const SizedBox(height: 80),
      ],
    );
  }
}
