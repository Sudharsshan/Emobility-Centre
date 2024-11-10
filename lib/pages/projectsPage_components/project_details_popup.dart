import 'package:flutter/material.dart';
import '../appTheme/theme_class.dart';

class ProjectDetailsPopup extends StatelessWidget {
  final String title;
  final String description;
  final ThemeClass theme;

  const ProjectDetailsPopup({
    super.key,
    required this.title,
    required this.description,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = theme.shamRock;

    return AlertDialog(
      // heading text
      title: Text(
        title,
        style: TextStyle(
          color: primaryColor,
          fontFamily: 'PlayfairDisplay',
          fontSize: 24,
        ),
      ),

      // context text
      content: Text(
        description,
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontFamily: 'Lora',
          fontSize: 16,
        ),
      ),

      // close button
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Close',
            style: TextStyle(
              color: primaryColor,
              fontFamily: 'PlayfairDisplay',
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
