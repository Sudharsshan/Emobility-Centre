import 'package:flutter/material.dart';

class TimeLineItemBuilder {
  late BuildContext context;
  late String title;
  late List<String> descriptions;
  late IconData icon;
  late Color primaryColor;
  late Color secondaryColor;
  late TextStyle headingStyle;
  late TextStyle contextStyle;
  late int index;
  late bool gridView;
  late Color backgroundFill;

  TimeLineItemBuilder();
  // Returns the main content boxes along with side icon bar

  // ignore: non_constant_identifier_names
  Widget TimeLineBuilder({
    required BuildContext context,
    required String title,
    required List<String> descriptions,
    required IconData icon,
    required Color primaryColor,
    required Color secondaryColor,
    required TextStyle headingStyle,
    required TextStyle contextStyle,
    required int index,
    required bool gridView,
    required Color backgroundFill,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Side icon with follow down bar design
            Column(
              children: [
                Icon(icon, color: primaryColor, size: 30.0),
                Container(
                  width: 2,
                  height: 100,
                  color: secondaryColor,
                ),
              ],
            ),
            const SizedBox(width: 16.0),

            // Content box
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: backgroundFill,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Box heading
                    Text(
                      title,
                      style: headingStyle,
                    ),
                    const SizedBox(height: 8.0),

                    // Return normal content boxes
                    if (!gridView)
                      ...descriptions.map((desc) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(desc, style: contextStyle),
                          )),

                    // Return grid boxes specifically for 'Key Areas'
                    if (gridView)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: descriptions.length,
                        itemBuilder: (context, index) {
                          // Returns the grid box with text content
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                descriptions[index],
                                style: contextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Drop down arrow mark to be shown only for 5 boxes (i.e., last box doesn't have this)
        if (index < 4)
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              children: [
                Container(
                  width: 2,
                  height: 30,
                  color: secondaryColor,
                ),
                Icon(Icons.expand_more, color: secondaryColor, size: 16.0),
              ],
            ),
          ),
      ],
    );
  }
}
