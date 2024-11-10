import 'package:flutter/material.dart';

class OurAchievements extends StatefulWidget {
  const OurAchievements({super.key});

  @override
  OurAchievementsState createState() => OurAchievementsState();
}

class OurAchievementsState extends State<OurAchievements> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward(); // Start the animation

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: GridView.builder(
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: GridTile(
                  header: Text('Header $index'),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Content of box $index'),
                  ), // Just for testing, will fill with image later
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
