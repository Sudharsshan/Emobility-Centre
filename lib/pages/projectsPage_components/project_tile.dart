import 'package:flutter/material.dart';
import '../appTheme/theme_class.dart';
import 'projects_page_content.dart';
import 'project_details_popup.dart';

class ProjectTile extends StatelessWidget {
  final int index;
  final ProjectsPageContent projectsContent;
  final ThemeClass theme;

  const ProjectTile({
    super.key,
    required this.index,
    required this.projectsContent,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = theme.shamRock;
    final Color secondaryColor = theme.secondaryAccent;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ProjectDetailsPopup(
              title: projectsContent.titles[index],
              description: projectsContent.description[index],
              theme: theme,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            // side decoration
            SizedBox(
              width: 30,
              child: Column(
                children: [
                  Icon(Icons.circle, size: 10, color: primaryColor),

                  // show the line only till last but one containers
                  if (index != projectsContent.titles.length - 1)
                    Container(
                      width: 2,
                      height: 50,
                      color: primaryColor,
                    ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // main content
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ThemeClass().cremeGreen.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 3)),
                  ],
                ),

                // projects box
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // project title
                    Text(
                      projectsContent.titles[index],
                      style: TextStyle(
                        color: primaryColor,
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),

                    // project description
                    Text(
                      projectsContent.description[index],
                      style: TextStyle(
                        color: secondaryColor,
                        fontFamily: 'Lora',
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
