import 'package:emobility/pages/projectsPage_components/project_tile.dart';
import 'package:emobility/pages/projectsPage_components/projects_page_content.dart';
import 'package:flutter/material.dart';
import 'appTheme/theme_class.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<Projects> with SingleTickerProviderStateMixin {
  bool _showProjects = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
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

  void _toggleProjects() {
    setState(() {
      _showProjects = !_showProjects;
      if (_showProjects) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeClass theme = ThemeClass();
    final Color primaryColor = theme.primaryAccent;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // heading
          Center(
            child: Column(
              children: [
                Text(
                  'Innovative Pathways to Sustainable Mobility',
                  style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'Lora',
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),

                // show/hide projects button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: _toggleProjects,
                  child: Text(
                    _showProjects ? 'Hide Projects' : 'View Projects',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // projects display
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: _showProjects
                  ? ListView.builder(
                itemCount: ProjectsPageContent().titles.length,
                itemBuilder: (context, index) {
                  return ProjectTile(
                    index: index,
                    projectsContent: ProjectsPageContent(),
                    theme: theme,
                  );
                },
              )
                  : Container(), // Empty container when projects are hidden
            ),
          ),

          // sized box to avoid nav bar overlay over page's content
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
