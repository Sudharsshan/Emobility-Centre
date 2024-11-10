// this file contains the data for custom UI scale factors determined
// by the flutter code for best visibility according to the given
// logic in:
// lib/models/ui_builder/scale_factor.dart

class UiScaleFactors {
  // these scale factors will be modified during the runtime of the app

  List<double> scaleFactors = [
    0.3, // heading text scale factor
    0.0, // context text scale factor
    1.0, // widget box width scale factor
    // add more scale factors as per requirements
  ];

  // converting the above idea into Maps for better understanding
  Map<String, double> scaleFactor = {
    'headingTextScale' : 0.0,
    'contextTextScale' : 1.0,
    'widgetBoxScale' : 2.5,
    // add more scale factors as per requirements
  };
}